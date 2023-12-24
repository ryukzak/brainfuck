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
