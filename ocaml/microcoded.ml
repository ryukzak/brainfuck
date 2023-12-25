(* Control unit with microcode

    +------------------(+1)-------+
    |                             |
    |    latch_program_counter    |
    |                  |          |
    |   +-----+        v          |
    +-->|     |     +---------+   |    +---------+
        | MUX |---->| program |---+--->| program |
    +-->|     |     | counter |        | memory  |
    |   +-----+     +---------+        +---------+
    |      ^                                |
    |      | sel_pc                         | current
    |      |                                | instruction
    +---------------(select-arg)------------+
           |                                |
           |                       (opcode) |
           |                                v
        +-----+                  +---------------+
        | MUX |<-- jmp_type      | opcode -> mPC |
        +-----+                  +---------------+
         ^   ^                         |
         |   |                         | mPC address
         |   | sel_pc                  |
         |   |                    0--+ | +-----+
         |   |                       | | |     |
         |   |                       v v v     |
         |   |                      +-----+    |
         |   |          sel_mPC --->| MUX |   (+1)
         |   |                      +-----+    |
         |   |                         |       |
         |   |                         v       |
         |   |     +----------+     +-----+    |
         |   +-----| mProgram |<----| mPC |----+
         |         +----------+     +-----+
         |               |
         |               | signals
         |               v
         | zero    +----------+
         +---------|          |
                   | DataPath |
    input -------->|          |----------> output
                   +----------+
*)

open Code
open Datapath

type mpc_sel =
  | Zero  (** Set mPC to 0 *)
  | Opcode  (** Set mPC base on opcode *)
  | Next  (** Increment mPC *)
[@@deriving show]

type pc_sel =
  | Next  (** Increment PC *)
  | Jmp  (** Set PC from instructon arg *)
  | Jz
      (** If data_path.zero == 0 then same as for Jmp else same as for Next.
        We have it only in Microcoded version because jmp_type should be selected
        by signal from microcode. *)
[@@deriving show]

(** All possible control signals in processor *)
type signal =
  | LatchDataAddr of data_address_sel
  | LatchAcc
  | DataMemoryWr of data_memory_sel
  | Output
  | LatchPc of pc_sel
  | LatchMpc of mpc_sel
  | Halt
[@@deriving show]

type control_unit = {
  pc : int;
  program : instruction array;
  mpc : int;
  mpc_of_opcode : opcode -> int;
  mprogram : signal list array;
  data_path : data_path;
  model_tick : int;
}
[@@deriving show]

let tick cu = { cu with model_tick = cu.model_tick + 1 }
let on_dp signal cu = { cu with data_path = signal cu.data_path }

let rec signal_latch_pc sel cu =
  match sel with
  | Next -> { cu with pc = cu.pc + 1 }
  | Jmp -> { cu with pc = cu.program.(cu.pc).arg |> Option.get }
  | Jz ->
      if cu.data_path.acc == 0 then signal_latch_pc Jmp cu
      else signal_latch_pc Next cu

let signal_latch_mpc sel cu =
  match sel with
  | Zero -> { cu with mpc = 0 }
  | Opcode -> { cu with mpc = cu.mpc_of_opcode cu.program.(cu.pc).opcode }
  | Next -> { cu with mpc = cu.mpc + 1 }

(** Map a signal description to function, which simulate the signal. *)
let dispatch (signal : signal) : control_unit -> control_unit =
  match signal with
  | LatchDataAddr sel -> on_dp (signal_latch_data_addr sel)
  | LatchAcc -> on_dp signal_latch_acc
  | DataMemoryWr sel -> on_dp (signal_data_memory_wr sel)
  | Output -> on_dp signal_output
  | LatchPc sel -> signal_latch_pc sel
  | LatchMpc sel -> signal_latch_mpc sel
  | Halt -> failwith "Halted."

let decode_and_execute_minstruction cu =
  let signals = cu.mprogram.(cu.mpc) in
  List.fold_left (fun cu' signal -> dispatch signal cu') cu signals

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

let show_micro_debug_of_control_unit cu =
  String.concat "\t"
    [
      "TICK:"; string_of_int cu.model_tick;
      "PC:"; string_of_int cu.pc;
      "ADDR:"; string_of_int cu.data_path.data_address;
      "MEM_OUT:"; string_of_int cu.data_path.data_memory.(cu.data_path.data_address);
      "ACC:"; string_of_int cu.data_path.acc;
      "MPC:"; string_of_int cu.mpc;
      "SIGNALS:"; String.concat ", " (List.map show_signal cu.mprogram.(cu.mpc));
    ]
[@@ocamlformat "disable"]

let rec simulate limit log_limit cu =
  try
    if cu.model_tick >= limit then failwith "Limit reached!";
    if cu.model_tick < log_limit then (
      if cu.mpc == 0 then print_endline (show_debug_of_control_unit cu);
      print_endline (show_micro_debug_of_control_unit cu));
    let cu' = cu |> decode_and_execute_minstruction |> tick in
    simulate limit log_limit cu'
  with e ->
    print_endline (Printexc.to_string e);
    cu

(************************************************************)
(* Machine execution *)

(** If opcode is a number from 0 to N, we can simply map it
  to first microinstruction for specific command by memory. E.g.:

  0: 1
  1: 2
  3: 3
  4: 5 ... *)
let mpc_of_opcode : opcode -> int = function
  | Left -> 1
  | Right -> 2
  | Inc -> 3
  | Dec -> 5
  | Input -> 7
  | Print -> 9
  | Jmp -> 11
  | Jz -> 12
  | Halt -> 14

(* Each array element is a microinstruction represented by a list of setted
   signals with arguments (selectors).

   If signal is not presented in the list -- that means zero signals. *)
let mprogram: signal list array =
  [|
    (* Instructin Fetch *)
    (* 0  *) [ LatchMpc Opcode ];
    (* Left *)
    (* 1  *) [ LatchDataAddr Left; LatchPc Next; LatchMpc Zero ];
    (* Right *)
    (* 2  *) [ LatchDataAddr Right; LatchPc Next; LatchMpc Zero ];
    (* Inc *)
    (* 3  *) [ LatchAcc; LatchMpc Next ];
    (* 4  *) [ DataMemoryWr Inc; LatchPc Next; LatchMpc Zero ];
    (* Dec *)
    (* 5  *) [ LatchAcc; LatchMpc Next ];
    (* 6  *) [ DataMemoryWr Dec; LatchPc Next; LatchMpc Zero ];
    (* Input *)
    (* 7  *) [ LatchAcc; LatchMpc Next ];
    (* 8  *) [ DataMemoryWr Input; LatchPc Next; LatchMpc Zero ];
    (* Print *)
    (* 9  *) [ LatchAcc; LatchMpc Next ];
    (* 10 *) [ Output; LatchPc Next; LatchMpc Zero ];
    (* Jmp *)
    (* 11 *) [ LatchPc Jmp; LatchMpc Zero ];
    (* Jz *)
    (* 12 *) [ LatchAcc; LatchMpc Next ];
    (* 13 *) [ LatchPc Jz; LatchMpc Zero ];
    (* Halt *)
    (* 14 *) [ Halt ];
  |]
[@@ocamlformat "disable"]

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
    program;
    mpc = 0;
    mpc_of_opcode;
    mprogram;
    model_tick = 0;
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
