(* Same as in Python version. *)

open Code
open Datapath

type control_unit = {
  pc : int;
  program : instruction array;
  data_path : data_path;
  model_tick : int;
}
[@@deriving show]

let tick cu = { cu with model_tick = cu.model_tick + 1 }
let on_dp signal cu = { cu with data_path = signal cu.data_path }

type pc_sel = Next | Jmp

let signal_latch_pc sel cu =
  match sel with
  | Next -> { cu with pc = cu.pc + 1 }
  | Jmp -> { cu with pc = cu.program.(cu.pc).arg |> Option.get }

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

let rec simulate limit log_limit cu =
  try
    if cu.model_tick >= limit then failwith "Limit reached!";
    if cu.model_tick < log_limit then
      print_endline (show_debug_of_control_unit cu);
    let cu' = decode_and_execute_instruction cu in
    simulate limit log_limit cu'
  with e ->
    print_endline (Printexc.to_string e);
    cu

(************************************************************)
(* Machine execution *)

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

let machine ~limit ~log_limit ~program_fn ~input_fn =
  let cu = control_unit_init program_fn input_fn in
  let cu' = simulate limit log_limit cu in
  print_endline (show_control_unit cu')
