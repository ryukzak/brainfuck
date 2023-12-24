let%expect_test "cat with hardwired model" =
  Machines.Hardwired.machine ~limit:10000 ~log_limit:10000
    ~program_fn:"examples/cat.json" ~input_fn:"examples/foo_input.txt";
  [%expect
    {|
    TICK:	0	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	Code.Input
    TICK:	2	PC:	1	ADDR:	0	MEM_OUT:	102	ACC:	0	Code.Jz
    TICK:	4	PC:	2	ADDR:	0	MEM_OUT:	102	ACC:	102	Code.Print
    TICK:	6	PC:	3	ADDR:	0	MEM_OUT:	102	ACC:	102	Code.Input
    TICK:	8	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	102	Code.Jmp
    TICK:	9	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	102	Code.Jz
    TICK:	11	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Print
    TICK:	13	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Input
    TICK:	15	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Jmp
    TICK:	16	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Jz
    TICK:	18	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Print
    TICK:	20	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Input
    TICK:	22	PC:	4	ADDR:	0	MEM_OUT:	10	ACC:	111	Code.Jmp
    TICK:	23	PC:	1	ADDR:	0	MEM_OUT:	10	ACC:	111	Code.Jz
    TICK:	25	PC:	2	ADDR:	0	MEM_OUT:	10	ACC:	10	Code.Print
    TICK:	27	PC:	3	ADDR:	0	MEM_OUT:	10	ACC:	10	Code.Input
    Failure("Input buffer is over.")
    { Hardwired.pc = 3;
      program =
      [|{ Code.index = 0; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 1; pos = 1; symbol = "," }) };
        { Code.index = 4; opcode = Code.Jz; arg = (Some 5);
          term = (Some { Code.line = 1; pos = 2; symbol = "[" }) };
        { Code.index = 2; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 1; pos = 3; symbol = "." }) };
        { Code.index = 3; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 1; pos = 4; symbol = "," }) };
        { Code.index = 4; opcode = Code.Jmp; arg = (Some 1);
          term = (Some { Code.line = 1; pos = 5; symbol = "]" }) };
        { Code.index = 5; opcode = Code.Halt; arg = None; term = None }|];
      data_path =
      { Datapath.data_address = 0;
        data_memory =
        [|10; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0|];
        acc = 10; input_buffer = []; output_buffer = ['f'; 'o'; 'o'; '\n'] };
      model_tick = 27 } |}]

let%expect_test "cat with microcoded model" =
  Machines.Microcoded.machine ~limit:10000 ~log_limit:10000
    ~program_fn:"examples/cat.json" ~input_fn:"examples/foo_input.txt";
  [%expect
    {|
    TICK:	0	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	Code.Input
    TICK:	0	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	1	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	MPC:	7	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	2	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	MPC:	8	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Input), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	3	PC:	1	ADDR:	0	MEM_OUT:	102	ACC:	0	Code.Jz
    TICK:	3	PC:	1	ADDR:	0	MEM_OUT:	102	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	4	PC:	1	ADDR:	0	MEM_OUT:	102	ACC:	0	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	5	PC:	1	ADDR:	0	MEM_OUT:	102	ACC:	102	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	6	PC:	2	ADDR:	0	MEM_OUT:	102	ACC:	102	Code.Print
    TICK:	6	PC:	2	ADDR:	0	MEM_OUT:	102	ACC:	102	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	7	PC:	2	ADDR:	0	MEM_OUT:	102	ACC:	102	MPC:	9	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	8	PC:	2	ADDR:	0	MEM_OUT:	102	ACC:	102	MPC:	10	SIGNALS:	Microcoded.Output, (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	9	PC:	3	ADDR:	0	MEM_OUT:	102	ACC:	102	Code.Input
    TICK:	9	PC:	3	ADDR:	0	MEM_OUT:	102	ACC:	102	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	10	PC:	3	ADDR:	0	MEM_OUT:	102	ACC:	102	MPC:	7	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	11	PC:	3	ADDR:	0	MEM_OUT:	102	ACC:	102	MPC:	8	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Input), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	12	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	102	Code.Jmp
    TICK:	12	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	102	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	13	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	102	MPC:	11	SIGNALS:	(Microcoded.LatchPc Microcoded.Jmp), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	14	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	102	Code.Jz
    TICK:	14	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	102	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	15	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	102	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	16	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	17	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Print
    TICK:	17	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	18	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	9	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	19	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	10	SIGNALS:	Microcoded.Output, (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	20	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Input
    TICK:	20	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	21	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	7	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	22	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	8	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Input), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	23	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Jmp
    TICK:	23	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	24	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	11	SIGNALS:	(Microcoded.LatchPc Microcoded.Jmp), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	25	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Jz
    TICK:	25	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	26	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	27	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	28	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Print
    TICK:	28	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	29	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	9	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	30	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	10	SIGNALS:	Microcoded.Output, (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	31	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	Code.Input
    TICK:	31	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	32	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	7	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	33	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	MPC:	8	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Input), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	34	PC:	4	ADDR:	0	MEM_OUT:	10	ACC:	111	Code.Jmp
    TICK:	34	PC:	4	ADDR:	0	MEM_OUT:	10	ACC:	111	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	35	PC:	4	ADDR:	0	MEM_OUT:	10	ACC:	111	MPC:	11	SIGNALS:	(Microcoded.LatchPc Microcoded.Jmp), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	36	PC:	1	ADDR:	0	MEM_OUT:	10	ACC:	111	Code.Jz
    TICK:	36	PC:	1	ADDR:	0	MEM_OUT:	10	ACC:	111	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	37	PC:	1	ADDR:	0	MEM_OUT:	10	ACC:	111	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	38	PC:	1	ADDR:	0	MEM_OUT:	10	ACC:	10	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	39	PC:	2	ADDR:	0	MEM_OUT:	10	ACC:	10	Code.Print
    TICK:	39	PC:	2	ADDR:	0	MEM_OUT:	10	ACC:	10	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	40	PC:	2	ADDR:	0	MEM_OUT:	10	ACC:	10	MPC:	9	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	41	PC:	2	ADDR:	0	MEM_OUT:	10	ACC:	10	MPC:	10	SIGNALS:	Microcoded.Output, (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	42	PC:	3	ADDR:	0	MEM_OUT:	10	ACC:	10	Code.Input
    TICK:	42	PC:	3	ADDR:	0	MEM_OUT:	10	ACC:	10	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	43	PC:	3	ADDR:	0	MEM_OUT:	10	ACC:	10	MPC:	7	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	44	PC:	3	ADDR:	0	MEM_OUT:	10	ACC:	10	MPC:	8	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Input), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    Failure("Input buffer is over.")
    { Microcoded.pc = 3;
      program =
      [|{ Code.index = 0; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 1; pos = 1; symbol = "," }) };
        { Code.index = 4; opcode = Code.Jz; arg = (Some 5);
          term = (Some { Code.line = 1; pos = 2; symbol = "[" }) };
        { Code.index = 2; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 1; pos = 3; symbol = "." }) };
        { Code.index = 3; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 1; pos = 4; symbol = "," }) };
        { Code.index = 4; opcode = Code.Jmp; arg = (Some 1);
          term = (Some { Code.line = 1; pos = 5; symbol = "]" }) };
        { Code.index = 5; opcode = Code.Halt; arg = None; term = None }|];
      mpc = 8; mpc_of_opcode = <fun>;
      mprogram =
      [|[(Microcoded.LatchMpc Microcoded.Opcode)];
        [(Microcoded.LatchDataAddr Datapath.Left);
          (Microcoded.LatchPc Microcoded.Next);
          (Microcoded.LatchMpc Microcoded.Zero)];
        [(Microcoded.LatchDataAddr Datapath.Right);
          (Microcoded.LatchPc Microcoded.Next);
          (Microcoded.LatchMpc Microcoded.Zero)];
        [Microcoded.LatchAcc; (Microcoded.LatchMpc Microcoded.Next)];
        [(Microcoded.DataMemoryWr Datapath.Inc);
          (Microcoded.LatchPc Microcoded.Next);
          (Microcoded.LatchMpc Microcoded.Zero)];
        [Microcoded.LatchAcc; (Microcoded.LatchMpc Microcoded.Next)];
        [(Microcoded.DataMemoryWr Datapath.Dec);
          (Microcoded.LatchPc Microcoded.Next);
          (Microcoded.LatchMpc Microcoded.Zero)];
        [Microcoded.LatchAcc; (Microcoded.LatchMpc Microcoded.Next)];
        [(Microcoded.DataMemoryWr Datapath.Input);
          (Microcoded.LatchPc Microcoded.Next);
          (Microcoded.LatchMpc Microcoded.Zero)];
        [Microcoded.LatchAcc; (Microcoded.LatchMpc Microcoded.Next)];
        [Microcoded.Output; (Microcoded.LatchPc Microcoded.Next);
          (Microcoded.LatchMpc Microcoded.Zero)];
        [(Microcoded.LatchPc Microcoded.Jmp);
          (Microcoded.LatchMpc Microcoded.Zero)];
        [Microcoded.LatchAcc; (Microcoded.LatchMpc Microcoded.Next)];
        [(Microcoded.LatchPc Microcoded.Jz);
          (Microcoded.LatchMpc Microcoded.Zero)];
        [Microcoded.Halt]|];
      data_path =
      { Datapath.data_address = 0;
        data_memory =
        [|10; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0|];
        acc = 10; input_buffer = []; output_buffer = ['f'; 'o'; 'o'; '\n'] };
      model_tick = 44 } |}]
