let cli_args =
  let args = Sys.argv |> Array.to_list in
  match args with
  | [ _; "hw"; program; input ] -> (Machines.Hardwired.machine, program, input)
  | [ _; "mc"; program; input ] -> (Machines.Microcoded.machine, program, input)
  | _ ->
      failwith "Wrong arguments: machine.exe <hw|mc> <code_file> <input_file>"

let () =
  let machine, program_fn, input_fn = cli_args in
  machine ~limit:10000 ~log_limit:10000 ~program_fn ~input_fn
