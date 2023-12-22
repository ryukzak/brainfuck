let cli_args =
  let args = Sys.argv |> Array.to_list in
  match args with
  | [ _; program; input ] -> (program, input)
  | _ -> failwith "Wrong arguments: machine.exe <code_file> <input_file>"

let () =
  let program_fn, input_fn = cli_args in
  Machine.machine 1000 program_fn input_fn
