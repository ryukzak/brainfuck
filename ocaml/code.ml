module Json = Yojson.Safe
module JsonUtil = Yojson.Safe.Util

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
  | text -> failwith ("opcode_of_string: invalid string: " ^ text)

type term = { line : int; pos : int; symbol : string } [@@deriving show]

let term_of_json_list = function
  | `List [ line; pos; symbol ] ->
      JsonUtil.
        { line = to_int line; pos = to_int pos; symbol = to_string symbol }
  | _ -> failwith "term_from_json_list: invalid json list"

type instruction = {
  index : int;
  opcode : opcode;
  arg : int option;
  term : term option;
}
[@@deriving show]

let instruction_of_json json =
  JsonUtil.(
    let index = member "index" json |> to_int
    and opcode = member "opcode" json |> to_string |> opcode_of_string
    and arg = member "arg" json |> to_int_option
    and term = member "term" json |> to_option term_of_json_list in
    { index; opcode; arg; term })

let program_from_file filename =
  Json.from_file filename |> JsonUtil.to_list
  |> List.map instruction_of_json
  |> Array.of_list
