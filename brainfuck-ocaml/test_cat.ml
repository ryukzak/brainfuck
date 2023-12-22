let%expect_test "test1" =
  Machine.machine 1000 "examples/cat.json" "examples/foo_input.txt";
  [%expect
    {|
    TICK:	2	PC:	1	ADDR:	0	MEM_OUT:	102	ACC:	0	Machine.Jz
    TICK:	4	PC:	2	ADDR:	0	MEM_OUT:	102	ACC:	102	Machine.Print
    TICK:	6	PC:	3	ADDR:	0	MEM_OUT:	102	ACC:	102	Machine.Input
    TICK:	8	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	102	Machine.Jmp
    TICK:	9	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	102	Machine.Jz
    TICK:	11	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	Machine.Print
    TICK:	13	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	Machine.Input
    TICK:	15	PC:	4	ADDR:	0	MEM_OUT:	111	ACC:	111	Machine.Jmp
    TICK:	16	PC:	1	ADDR:	0	MEM_OUT:	111	ACC:	111	Machine.Jz
    TICK:	18	PC:	2	ADDR:	0	MEM_OUT:	111	ACC:	111	Machine.Print
    TICK:	20	PC:	3	ADDR:	0	MEM_OUT:	111	ACC:	111	Machine.Input
    TICK:	22	PC:	4	ADDR:	0	MEM_OUT:	10	ACC:	111	Machine.Jmp
    TICK:	23	PC:	1	ADDR:	0	MEM_OUT:	10	ACC:	111	Machine.Jz
    TICK:	25	PC:	2	ADDR:	0	MEM_OUT:	10	ACC:	10	Machine.Print
    TICK:	27	PC:	3	ADDR:	0	MEM_OUT:	10	ACC:	10	Machine.Input
    Failure("Input buffer is over.")
    { Machine.pc = 3;
      program =
      [|{ Machine.index = 0; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 1; pos = 1; symbol = "," }) };
        { Machine.index = 4; opcode = Machine.Jz; arg = (Some 5);
          term = (Some { Machine.line = 1; pos = 2; symbol = "[" }) };
        { Machine.index = 2; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 1; pos = 3; symbol = "." }) };
        { Machine.index = 3; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 1; pos = 4; symbol = "," }) };
        { Machine.index = 4; opcode = Machine.Jmp; arg = (Some 1);
          term = (Some { Machine.line = 1; pos = 5; symbol = "]" }) };
        { Machine.index = 5; opcode = Machine.Halt; arg = None; term = None }|];
      data_path =
      { Machine.data_address = 0;
        data_memory =
        [|10; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0|];
        acc = 10; input_buffer = []; output_buffer = ['f'; 'o'; 'o'; '\n'] };
      model_tick = 27 } |}]
