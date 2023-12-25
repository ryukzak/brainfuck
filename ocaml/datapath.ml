open Code

type data_path = {
  data_address : int;
  data_memory : int array;
  acc : int;
  input_buffer : char list;
  output_buffer : char list;
}
[@@deriving show]

type data_address_sel = Left | Right [@@deriving show]

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

type data_memory_sel = Inc | Dec | Input [@@deriving show]

let data_memory_sel : opcode -> data_memory_sel = function
  | Inc -> Inc
  | Dec -> Dec
  | Input -> Input
  | _ -> failwith "data_memory_sel: invalid opcode"

let signal_data_memory_wr sel data_path =
  match sel with
  | Inc | Dec ->
      {
        data_path with
        data_memory =
          (let mem = Array.copy data_path.data_memory
           and change = if sel == Inc then 1 else -1 in
           mem.(data_path.data_address) <-
             data_path.data_memory.(data_path.data_address) + change;
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
