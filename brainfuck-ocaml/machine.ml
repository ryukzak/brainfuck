module Json = Yojson.Safe
module JsonU = Yojson.Safe.Util

(************************************************************)
(* Code parsing from json file. *)

type opcode = Left | Right | Inc | Dec | Input | Print | Jmp | Jz | Halt
[@@deriving show]

let opcode_of_string = function
  | "right" -> Right
  | "left" -> Left
  | "increment" -> Inc
  | "decrement" -> Dec
  | "input" -> Input
  | "print" -> Print
  | "jmp" -> Jmp
  | "jz" -> Jz
  | "halt" -> Halt
  | text -> failwith ("isa_from_string: invalid string: " ^ text)

type term = { line : int; pos : int; symbol : string } [@@deriving show]

let term_fo_json_list = function
  | `List [ line; pos; symbol ] ->
      {
        line = JsonU.to_int line;
        pos = JsonU.to_int pos;
        symbol = JsonU.to_string symbol;
      }
  | _ -> failwith "term_from_json_list: invalid json list"

type instruction = {
  index : int;
  opcode : opcode;
  arg : int option;
  term : term option;
}
[@@deriving show]

let instruction_from_json json =
  let index = JsonU.member "index" json |> JsonU.to_int
  and opcode = JsonU.member "opcode" json |> JsonU.to_string |> opcode_of_string
  and arg = JsonU.member "arg" json |> JsonU.to_int_option
  and term = JsonU.member "term" json |> JsonU.to_option term_fo_json_list in
  { index; opcode; arg; term }

let program_from_file filename =
  Json.from_file filename |> JsonU.to_list
  |> List.map instruction_from_json
  |> Array.of_list

(************************************************************)
(* data_path *)

type data_path = {
  data_address : int;
  data_memory : int array;
  acc : int;
  input_buffer : char list;
  output_buffer : char list;
}
[@@deriving show]

type data_address_sel = Left | Right

let data_address_sel : opcode -> data_address_sel = function
  | Left -> Left
  | Right -> Right
  | _ -> failwith "data_address_sel: invalid opcode"

let signal_latch_data_addr sel data_path =
  match sel with
  | Left -> { data_path with data_address = data_path.data_address - 1 }
  | Right -> { data_path with data_address = data_path.data_address + 1 }

let signal_latch_acc data_path =
  { data_path with acc = data_path.data_memory.(data_path.data_address) }

type data_memory_sel = Inc | Dec | Input

let data_memory_sel : opcode -> data_memory_sel = function
  | Inc -> Inc
  | Dec -> Dec
  | Input -> Input
  | _ -> failwith "data_memory_sel: invalid opcode"

let signal_data_memory_wr sel data_path =
  match sel with
  | Inc ->
      {
        data_path with
        data_memory =
          (let mem = Array.copy data_path.data_memory in
           mem.(data_path.data_address) <-
             data_path.data_memory.(data_path.data_address) + 1;
           mem);
      }
  | Dec ->
      {
        data_path with
        data_memory =
          (let mem = Array.copy data_path.data_memory in
           mem.(data_path.data_address) <-
             data_path.data_memory.(data_path.data_address) - 1;
           mem);
      }
  | Input -> (
      match data_path.input_buffer with
      | [] -> failwith "Input buffer is over."
      | x :: xs ->
          {
            data_path with
            input_buffer = xs;
            data_memory =
              (let mem = Array.copy data_path.data_memory in
               mem.(data_path.data_address) <- int_of_char x;
               mem);
          })

let signal_output data_path =
  {
    data_path with
    output_buffer =
      List.concat [ data_path.output_buffer; [ char_of_int data_path.acc ] ];
  }

(************************************************************)
(* control_unit *)

type control_unit = {
  pc : int;
  program : instruction array;
  data_path : data_path;
  model_tick : int;
}
[@@deriving show]

let tick cu = { cu with model_tick = cu.model_tick + 1 }

type pc_sel = Next | Jmp

let signal_latch_pc sel cu =
  match sel with
  | Next -> { cu with pc = cu.pc + 1 }
  | Jmp -> { cu with pc = cu.program.(cu.pc).arg |> Option.get }

let on_dp signal cu = { cu with data_path = signal cu.data_path }

let decode_and_execute_instruction cu =
  let instruction = cu.program.(cu.pc) in
  match instruction.opcode with
  | Left | Right ->
      let sel = data_address_sel instruction.opcode in
      cu |> on_dp (signal_latch_data_addr sel) |> signal_latch_pc Next |> tick
  | Inc | Dec | Input ->
      let sel = data_memory_sel instruction.opcode in
      cu |> on_dp signal_latch_acc |> tick
         |> on_dp (signal_data_memory_wr sel) |> signal_latch_pc Next |> tick
  | Print ->
      cu |> on_dp signal_latch_acc |> tick
         |> on_dp signal_output |> signal_latch_pc Next |> tick
  | Jmp ->
      cu |> signal_latch_pc Jmp |> tick
  | Jz ->
      cu |> on_dp signal_latch_acc |> tick
         |> (fun cu -> signal_latch_pc (if cu.data_path.acc == 0 then Jmp else Next) cu) |> tick
  | Halt -> failwith "Halted."
[@@ocamlformat "disable"]

let show_debug_of_control_unit cu =
  String.concat "\t"
    [
      "TICK:"; string_of_int cu.model_tick;
      "PC:"; string_of_int cu.pc;
      "ADDR:"; string_of_int cu.data_path.data_address;
      "MEM_OUT:"; string_of_int cu.data_path.data_memory.(cu.data_path.data_address);
      "ACC:"; string_of_int cu.data_path.acc;
      show_opcode cu.program.(cu.pc).opcode;
    ]
[@@ocamlformat "disable"]

let rec simulate n cu =
  try
    match n with
    | 0 -> failwith "Limit reached!"
    | _ ->
        let cu' = decode_and_execute_instruction cu in
        print_endline (show_debug_of_control_unit cu');
        simulate (n - 1) cu'
  with e ->
    print_endline (Printexc.to_string e);
    cu

(************************************************************)
(* CLI Interfact *)

let control_unit_init program_fn input_fn =
  let data_memory_size = 20
  and program = program_from_file program_fn
  and input =
    let ch = open_in input_fn in
    let string = really_input_string ch (in_channel_length ch) in
    string |> String.to_seq |> List.of_seq
  in
  {
    pc = 0;
    model_tick = 0;
    program;
    data_path =
      {
        data_address = 0;
        data_memory = Array.make data_memory_size 0;
        acc = 0;
        input_buffer = input;
        output_buffer = [];
      };
  }

let machine limit program_fn input_fn =
  let cu = control_unit_init program_fn input_fn in
  let cu' = simulate limit cu in
  print_endline (show_control_unit cu')
