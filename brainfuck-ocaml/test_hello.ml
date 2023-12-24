let%expect_test "test1" =
  Machines.Hardwired.machine ~limit:10000 ~log_limit:250
    ~program_fn:"examples/hello.json" ~input_fn:"examples/foo_input.txt";
  [%expect
    {|
    TICK:	0	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	Code.Jz
    TICK:	2	PC:	24	ADDR:	0	MEM_OUT:	0	ACC:	0	Code.Inc
    TICK:	4	PC:	25	ADDR:	0	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	6	PC:	26	ADDR:	0	MEM_OUT:	2	ACC:	1	Code.Inc
    TICK:	8	PC:	27	ADDR:	0	MEM_OUT:	3	ACC:	2	Code.Inc
    TICK:	10	PC:	28	ADDR:	0	MEM_OUT:	4	ACC:	3	Code.Inc
    TICK:	12	PC:	29	ADDR:	0	MEM_OUT:	5	ACC:	4	Code.Inc
    TICK:	14	PC:	30	ADDR:	0	MEM_OUT:	6	ACC:	5	Code.Inc
    TICK:	16	PC:	31	ADDR:	0	MEM_OUT:	7	ACC:	6	Code.Inc
    TICK:	18	PC:	32	ADDR:	0	MEM_OUT:	8	ACC:	7	Code.Jz
    TICK:	20	PC:	33	ADDR:	0	MEM_OUT:	8	ACC:	8	Code.Right
    TICK:	21	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	8	Code.Inc
    TICK:	23	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	25	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Code.Inc
    TICK:	27	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Code.Inc
    TICK:	29	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Code.Jz
    TICK:	31	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Code.Right
    TICK:	32	PC:	40	ADDR:	2	MEM_OUT:	0	ACC:	4	Code.Inc
    TICK:	34	PC:	41	ADDR:	2	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	36	PC:	42	ADDR:	2	MEM_OUT:	2	ACC:	1	Code.Right
    TICK:	37	PC:	43	ADDR:	3	MEM_OUT:	0	ACC:	1	Code.Inc
    TICK:	39	PC:	44	ADDR:	3	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	41	PC:	45	ADDR:	3	MEM_OUT:	2	ACC:	1	Code.Inc
    TICK:	43	PC:	46	ADDR:	3	MEM_OUT:	3	ACC:	2	Code.Right
    TICK:	44	PC:	47	ADDR:	4	MEM_OUT:	0	ACC:	2	Code.Inc
    TICK:	46	PC:	48	ADDR:	4	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	48	PC:	49	ADDR:	4	MEM_OUT:	2	ACC:	1	Code.Inc
    TICK:	50	PC:	50	ADDR:	4	MEM_OUT:	3	ACC:	2	Code.Right
    TICK:	51	PC:	51	ADDR:	5	MEM_OUT:	0	ACC:	2	Code.Inc
    TICK:	53	PC:	52	ADDR:	5	MEM_OUT:	1	ACC:	0	Code.Left
    TICK:	54	PC:	53	ADDR:	4	MEM_OUT:	3	ACC:	0	Code.Left
    TICK:	55	PC:	54	ADDR:	3	MEM_OUT:	3	ACC:	0	Code.Left
    TICK:	56	PC:	55	ADDR:	2	MEM_OUT:	2	ACC:	0	Code.Left
    TICK:	57	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	0	Code.Dec
    TICK:	59	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Code.Jmp
    TICK:	60	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Code.Jz
    TICK:	62	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Code.Right
    TICK:	63	PC:	40	ADDR:	2	MEM_OUT:	2	ACC:	3	Code.Inc
    TICK:	65	PC:	41	ADDR:	2	MEM_OUT:	3	ACC:	2	Code.Inc
    TICK:	67	PC:	42	ADDR:	2	MEM_OUT:	4	ACC:	3	Code.Right
    TICK:	68	PC:	43	ADDR:	3	MEM_OUT:	3	ACC:	3	Code.Inc
    TICK:	70	PC:	44	ADDR:	3	MEM_OUT:	4	ACC:	3	Code.Inc
    TICK:	72	PC:	45	ADDR:	3	MEM_OUT:	5	ACC:	4	Code.Inc
    TICK:	74	PC:	46	ADDR:	3	MEM_OUT:	6	ACC:	5	Code.Right
    TICK:	75	PC:	47	ADDR:	4	MEM_OUT:	3	ACC:	5	Code.Inc
    TICK:	77	PC:	48	ADDR:	4	MEM_OUT:	4	ACC:	3	Code.Inc
    TICK:	79	PC:	49	ADDR:	4	MEM_OUT:	5	ACC:	4	Code.Inc
    TICK:	81	PC:	50	ADDR:	4	MEM_OUT:	6	ACC:	5	Code.Right
    TICK:	82	PC:	51	ADDR:	5	MEM_OUT:	1	ACC:	5	Code.Inc
    TICK:	84	PC:	52	ADDR:	5	MEM_OUT:	2	ACC:	1	Code.Left
    TICK:	85	PC:	53	ADDR:	4	MEM_OUT:	6	ACC:	1	Code.Left
    TICK:	86	PC:	54	ADDR:	3	MEM_OUT:	6	ACC:	1	Code.Left
    TICK:	87	PC:	55	ADDR:	2	MEM_OUT:	4	ACC:	1	Code.Left
    TICK:	88	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	1	Code.Dec
    TICK:	90	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Code.Jmp
    TICK:	91	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Code.Jz
    TICK:	93	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Code.Right
    TICK:	94	PC:	40	ADDR:	2	MEM_OUT:	4	ACC:	2	Code.Inc
    TICK:	96	PC:	41	ADDR:	2	MEM_OUT:	5	ACC:	4	Code.Inc
    TICK:	98	PC:	42	ADDR:	2	MEM_OUT:	6	ACC:	5	Code.Right
    TICK:	99	PC:	43	ADDR:	3	MEM_OUT:	6	ACC:	5	Code.Inc
    TICK:	101	PC:	44	ADDR:	3	MEM_OUT:	7	ACC:	6	Code.Inc
    TICK:	103	PC:	45	ADDR:	3	MEM_OUT:	8	ACC:	7	Code.Inc
    TICK:	105	PC:	46	ADDR:	3	MEM_OUT:	9	ACC:	8	Code.Right
    TICK:	106	PC:	47	ADDR:	4	MEM_OUT:	6	ACC:	8	Code.Inc
    TICK:	108	PC:	48	ADDR:	4	MEM_OUT:	7	ACC:	6	Code.Inc
    TICK:	110	PC:	49	ADDR:	4	MEM_OUT:	8	ACC:	7	Code.Inc
    TICK:	112	PC:	50	ADDR:	4	MEM_OUT:	9	ACC:	8	Code.Right
    TICK:	113	PC:	51	ADDR:	5	MEM_OUT:	2	ACC:	8	Code.Inc
    TICK:	115	PC:	52	ADDR:	5	MEM_OUT:	3	ACC:	2	Code.Left
    TICK:	116	PC:	53	ADDR:	4	MEM_OUT:	9	ACC:	2	Code.Left
    TICK:	117	PC:	54	ADDR:	3	MEM_OUT:	9	ACC:	2	Code.Left
    TICK:	118	PC:	55	ADDR:	2	MEM_OUT:	6	ACC:	2	Code.Left
    TICK:	119	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	2	Code.Dec
    TICK:	121	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Code.Jmp
    TICK:	122	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Code.Jz
    TICK:	124	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Code.Right
    TICK:	125	PC:	40	ADDR:	2	MEM_OUT:	6	ACC:	1	Code.Inc
    TICK:	127	PC:	41	ADDR:	2	MEM_OUT:	7	ACC:	6	Code.Inc
    TICK:	129	PC:	42	ADDR:	2	MEM_OUT:	8	ACC:	7	Code.Right
    TICK:	130	PC:	43	ADDR:	3	MEM_OUT:	9	ACC:	7	Code.Inc
    TICK:	132	PC:	44	ADDR:	3	MEM_OUT:	10	ACC:	9	Code.Inc
    TICK:	134	PC:	45	ADDR:	3	MEM_OUT:	11	ACC:	10	Code.Inc
    TICK:	136	PC:	46	ADDR:	3	MEM_OUT:	12	ACC:	11	Code.Right
    TICK:	137	PC:	47	ADDR:	4	MEM_OUT:	9	ACC:	11	Code.Inc
    TICK:	139	PC:	48	ADDR:	4	MEM_OUT:	10	ACC:	9	Code.Inc
    TICK:	141	PC:	49	ADDR:	4	MEM_OUT:	11	ACC:	10	Code.Inc
    TICK:	143	PC:	50	ADDR:	4	MEM_OUT:	12	ACC:	11	Code.Right
    TICK:	144	PC:	51	ADDR:	5	MEM_OUT:	3	ACC:	11	Code.Inc
    TICK:	146	PC:	52	ADDR:	5	MEM_OUT:	4	ACC:	3	Code.Left
    TICK:	147	PC:	53	ADDR:	4	MEM_OUT:	12	ACC:	3	Code.Left
    TICK:	148	PC:	54	ADDR:	3	MEM_OUT:	12	ACC:	3	Code.Left
    TICK:	149	PC:	55	ADDR:	2	MEM_OUT:	8	ACC:	3	Code.Left
    TICK:	150	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	3	Code.Dec
    TICK:	152	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Code.Jmp
    TICK:	153	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Code.Jz
    TICK:	155	PC:	58	ADDR:	1	MEM_OUT:	0	ACC:	0	Code.Right
    TICK:	156	PC:	59	ADDR:	2	MEM_OUT:	8	ACC:	0	Code.Inc
    TICK:	158	PC:	60	ADDR:	2	MEM_OUT:	9	ACC:	8	Code.Right
    TICK:	159	PC:	61	ADDR:	3	MEM_OUT:	12	ACC:	8	Code.Inc
    TICK:	161	PC:	62	ADDR:	3	MEM_OUT:	13	ACC:	12	Code.Right
    TICK:	162	PC:	63	ADDR:	4	MEM_OUT:	12	ACC:	12	Code.Dec
    TICK:	164	PC:	64	ADDR:	4	MEM_OUT:	11	ACC:	12	Code.Right
    TICK:	165	PC:	65	ADDR:	5	MEM_OUT:	4	ACC:	12	Code.Right
    TICK:	166	PC:	66	ADDR:	6	MEM_OUT:	0	ACC:	12	Code.Inc
    TICK:	168	PC:	67	ADDR:	6	MEM_OUT:	1	ACC:	0	Code.Jz
    TICK:	170	PC:	68	ADDR:	6	MEM_OUT:	1	ACC:	1	Code.Left
    TICK:	171	PC:	69	ADDR:	5	MEM_OUT:	4	ACC:	1	Code.Jmp
    TICK:	172	PC:	67	ADDR:	5	MEM_OUT:	4	ACC:	1	Code.Jz
    TICK:	174	PC:	68	ADDR:	5	MEM_OUT:	4	ACC:	4	Code.Left
    TICK:	175	PC:	69	ADDR:	4	MEM_OUT:	11	ACC:	4	Code.Jmp
    TICK:	176	PC:	67	ADDR:	4	MEM_OUT:	11	ACC:	4	Code.Jz
    TICK:	178	PC:	68	ADDR:	4	MEM_OUT:	11	ACC:	11	Code.Left
    TICK:	179	PC:	69	ADDR:	3	MEM_OUT:	13	ACC:	11	Code.Jmp
    TICK:	180	PC:	67	ADDR:	3	MEM_OUT:	13	ACC:	11	Code.Jz
    TICK:	182	PC:	68	ADDR:	3	MEM_OUT:	13	ACC:	13	Code.Left
    TICK:	183	PC:	69	ADDR:	2	MEM_OUT:	9	ACC:	13	Code.Jmp
    TICK:	184	PC:	67	ADDR:	2	MEM_OUT:	9	ACC:	13	Code.Jz
    TICK:	186	PC:	68	ADDR:	2	MEM_OUT:	9	ACC:	9	Code.Left
    TICK:	187	PC:	69	ADDR:	1	MEM_OUT:	0	ACC:	9	Code.Jmp
    TICK:	188	PC:	67	ADDR:	1	MEM_OUT:	0	ACC:	9	Code.Jz
    TICK:	190	PC:	70	ADDR:	1	MEM_OUT:	0	ACC:	0	Code.Left
    TICK:	191	PC:	71	ADDR:	0	MEM_OUT:	8	ACC:	0	Code.Dec
    TICK:	193	PC:	72	ADDR:	0	MEM_OUT:	7	ACC:	8	Code.Jmp
    TICK:	194	PC:	32	ADDR:	0	MEM_OUT:	7	ACC:	8	Code.Jz
    TICK:	196	PC:	33	ADDR:	0	MEM_OUT:	7	ACC:	7	Code.Right
    TICK:	197	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	7	Code.Inc
    TICK:	199	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	201	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Code.Inc
    TICK:	203	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Code.Inc
    TICK:	205	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Code.Jz
    TICK:	207	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Code.Right
    TICK:	208	PC:	40	ADDR:	2	MEM_OUT:	9	ACC:	4	Code.Inc
    TICK:	210	PC:	41	ADDR:	2	MEM_OUT:	10	ACC:	9	Code.Inc
    TICK:	212	PC:	42	ADDR:	2	MEM_OUT:	11	ACC:	10	Code.Right
    TICK:	213	PC:	43	ADDR:	3	MEM_OUT:	13	ACC:	10	Code.Inc
    TICK:	215	PC:	44	ADDR:	3	MEM_OUT:	14	ACC:	13	Code.Inc
    TICK:	217	PC:	45	ADDR:	3	MEM_OUT:	15	ACC:	14	Code.Inc
    TICK:	219	PC:	46	ADDR:	3	MEM_OUT:	16	ACC:	15	Code.Right
    TICK:	220	PC:	47	ADDR:	4	MEM_OUT:	11	ACC:	15	Code.Inc
    TICK:	222	PC:	48	ADDR:	4	MEM_OUT:	12	ACC:	11	Code.Inc
    TICK:	224	PC:	49	ADDR:	4	MEM_OUT:	13	ACC:	12	Code.Inc
    TICK:	226	PC:	50	ADDR:	4	MEM_OUT:	14	ACC:	13	Code.Right
    TICK:	227	PC:	51	ADDR:	5	MEM_OUT:	4	ACC:	13	Code.Inc
    TICK:	229	PC:	52	ADDR:	5	MEM_OUT:	5	ACC:	4	Code.Left
    TICK:	230	PC:	53	ADDR:	4	MEM_OUT:	14	ACC:	4	Code.Left
    TICK:	231	PC:	54	ADDR:	3	MEM_OUT:	16	ACC:	4	Code.Left
    TICK:	232	PC:	55	ADDR:	2	MEM_OUT:	11	ACC:	4	Code.Left
    TICK:	233	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	4	Code.Dec
    TICK:	235	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Code.Jmp
    TICK:	236	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Code.Jz
    TICK:	238	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Code.Right
    TICK:	239	PC:	40	ADDR:	2	MEM_OUT:	11	ACC:	3	Code.Inc
    TICK:	241	PC:	41	ADDR:	2	MEM_OUT:	12	ACC:	11	Code.Inc
    TICK:	243	PC:	42	ADDR:	2	MEM_OUT:	13	ACC:	12	Code.Right
    TICK:	244	PC:	43	ADDR:	3	MEM_OUT:	16	ACC:	12	Code.Inc
    TICK:	246	PC:	44	ADDR:	3	MEM_OUT:	17	ACC:	16	Code.Inc
    TICK:	248	PC:	45	ADDR:	3	MEM_OUT:	18	ACC:	17	Code.Inc
    Failure("Halted.")
    { Hardwired.pc = 130;
      program =
      [|{ Code.index = 23; opcode = Code.Jz; arg = (Some 24);
          term = (Some { Code.line = 1; pos = 1; symbol = "[" }) };
        { Code.index = 1; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 12; pos = 7; symbol = "," }) };
        { Code.index = 2; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 19; pos = 11; symbol = "." }) };
        { Code.index = 5; opcode = Code.Jz; arg = (Some 6);
          term = (Some { Code.line = 20; pos = 1; symbol = "[" }) };
        { Code.index = 4; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 24; pos = 9; symbol = "." }) };
        { Code.index = 5; opcode = Code.Jmp; arg = (Some 3);
          term = (Some { Code.line = 24; pos = 10; symbol = "]" }) };
        { Code.index = 6; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 31; pos = 6; symbol = "," }) };
        { Code.index = 7; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 53; pos = 11; symbol = "." }) };
        { Code.index = 8; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 55; pos = 2; symbol = "." }) };
        { Code.index = 9; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 55; pos = 4; symbol = "," }) };
        { Code.index = 10; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 56; pos = 2; symbol = "," }) };
        { Code.index = 11; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 56; pos = 4; symbol = "," }) };
        { Code.index = 12; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 57; pos = 2; symbol = "+" }) };
        { Code.index = 13; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 57; pos = 4; symbol = "," }) };
        { Code.index = 14; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 58; pos = 2; symbol = "-" }) };
        { Code.index = 15; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 58; pos = 4; symbol = "," }) };
        { Code.index = 16; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 59; pos = 2; symbol = "<" }) };
        { Code.index = 17; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 61; pos = 2; symbol = ">" }) };
        { Code.index = 18; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 65; pos = 8; symbol = "," }) };
        { Code.index = 20; opcode = Code.Jz; arg = (Some 21);
          term = (Some { Code.line = 67; pos = 2; symbol = "[" }) };
        { Code.index = 20; opcode = Code.Jmp; arg = (Some 19);
          term = (Some { Code.line = 69; pos = 2; symbol = "]" }) };
        { Code.index = 21; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 75; pos = 9; symbol = "." }) };
        { Code.index = 22; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 103; pos = 8; symbol = "." }) };
        { Code.index = 23; opcode = Code.Jmp; arg = (Some 0);
          term = (Some { Code.line = 104; pos = 1; symbol = "]" }) };
        { Code.index = 24; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 1; symbol = "+" }) };
        { Code.index = 25; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 2; symbol = "+" }) };
        { Code.index = 26; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 3; symbol = "+" }) };
        { Code.index = 27; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 4; symbol = "+" }) };
        { Code.index = 28; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 5; symbol = "+" }) };
        { Code.index = 29; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 6; symbol = "+" }) };
        { Code.index = 30; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 7; symbol = "+" }) };
        { Code.index = 31; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 8; symbol = "+" }) };
        { Code.index = 72; opcode = Code.Jz; arg = (Some 73);
          term = (Some { Code.line = 111; pos = 1; symbol = "[" }) };
        { Code.index = 33; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 112; pos = 1; symbol = ">" }) };
        { Code.index = 34; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 112; pos = 2; symbol = "+" }) };
        { Code.index = 35; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 112; pos = 3; symbol = "+" }) };
        { Code.index = 36; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 112; pos = 4; symbol = "+" }) };
        { Code.index = 37; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 112; pos = 5; symbol = "+" }) };
        { Code.index = 57; opcode = Code.Jz; arg = (Some 58);
          term = (Some { Code.line = 126; pos = 1; symbol = "[" }) };
        { Code.index = 39; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 136; pos = 1; symbol = ">" }) };
        { Code.index = 40; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 136; pos = 2; symbol = "+" }) };
        { Code.index = 41; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 136; pos = 3; symbol = "+" }) };
        { Code.index = 42; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 142; pos = 1; symbol = ">" }) };
        { Code.index = 43; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 142; pos = 2; symbol = "+" }) };
        { Code.index = 44; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 142; pos = 3; symbol = "+" }) };
        { Code.index = 45; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 142; pos = 4; symbol = "+" }) };
        { Code.index = 46; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 148; pos = 1; symbol = ">" }) };
        { Code.index = 47; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 148; pos = 2; symbol = "+" }) };
        { Code.index = 48; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 148; pos = 3; symbol = "+" }) };
        { Code.index = 49; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 148; pos = 4; symbol = "+" }) };
        { Code.index = 50; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 154; pos = 1; symbol = ">" }) };
        { Code.index = 51; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 154; pos = 2; symbol = "+" }) };
        { Code.index = 52; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 160; pos = 1; symbol = "<" }) };
        { Code.index = 53; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 160; pos = 2; symbol = "<" }) };
        { Code.index = 54; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 160; pos = 3; symbol = "<" }) };
        { Code.index = 55; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 160; pos = 4; symbol = "<" }) };
        { Code.index = 56; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 160; pos = 5; symbol = "-" }) };
        { Code.index = 57; opcode = Code.Jmp; arg = (Some 38);
          term = (Some { Code.line = 168; pos = 1; symbol = "]" }) };
        { Code.index = 58; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 180; pos = 1; symbol = ">" }) };
        { Code.index = 59; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 180; pos = 2; symbol = "+" }) };
        { Code.index = 60; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 186; pos = 1; symbol = ">" }) };
        { Code.index = 61; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 186; pos = 2; symbol = "+" }) };
        { Code.index = 62; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 192; pos = 1; symbol = ">" }) };
        { Code.index = 63; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 192; pos = 2; symbol = "-" }) };
        { Code.index = 64; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 198; pos = 1; symbol = ">" }) };
        { Code.index = 65; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 198; pos = 2; symbol = ">" }) };
        { Code.index = 66; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 198; pos = 3; symbol = "+" }) };
        { Code.index = 69; opcode = Code.Jz; arg = (Some 70);
          term = (Some { Code.line = 204; pos = 1; symbol = "[" }) };
        { Code.index = 68; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 204; pos = 2; symbol = "<" }) };
        { Code.index = 69; opcode = Code.Jmp; arg = (Some 67);
          term = (Some { Code.line = 204; pos = 3; symbol = "]" }) };
        { Code.index = 70; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 226; pos = 1; symbol = "<" }) };
        { Code.index = 71; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 226; pos = 2; symbol = "-" }) };
        { Code.index = 72; opcode = Code.Jmp; arg = (Some 32);
          term = (Some { Code.line = 234; pos = 1; symbol = "]" }) };
        { Code.index = 73; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 272; pos = 1; symbol = ">" }) };
        { Code.index = 74; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 272; pos = 2; symbol = ">" }) };
        { Code.index = 75; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 272; pos = 3; symbol = "." }) };
        { Code.index = 76; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 281; pos = 1; symbol = ">" }) };
        { Code.index = 77; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 281; pos = 2; symbol = "-" }) };
        { Code.index = 78; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 281; pos = 3; symbol = "-" }) };
        { Code.index = 79; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 281; pos = 4; symbol = "-" }) };
        { Code.index = 80; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 281; pos = 5; symbol = "." }) };
        { Code.index = 81; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 1; symbol = "+" }) };
        { Code.index = 82; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 2; symbol = "+" }) };
        { Code.index = 83; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 3; symbol = "+" }) };
        { Code.index = 84; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 4; symbol = "+" }) };
        { Code.index = 85; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 5; symbol = "+" }) };
        { Code.index = 86; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 6; symbol = "+" }) };
        { Code.index = 87; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 7; symbol = "+" }) };
        { Code.index = 88; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 293; pos = 8; symbol = "." }) };
        { Code.index = 89; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 293; pos = 9; symbol = "." }) };
        { Code.index = 90; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 10; symbol = "+" }) };
        { Code.index = 91; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 11; symbol = "+" }) };
        { Code.index = 92; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 12; symbol = "+" }) };
        { Code.index = 93; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 293; pos = 13; symbol = "." }) };
        { Code.index = 94; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 300; pos = 1; symbol = ">" }) };
        { Code.index = 95; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 300; pos = 2; symbol = ">" }) };
        { Code.index = 96; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 300; pos = 3; symbol = "." }) };
        { Code.index = 97; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 308; pos = 1; symbol = "<" }) };
        { Code.index = 98; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 308; pos = 2; symbol = "-" }) };
        { Code.index = 99; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 308; pos = 3; symbol = "." }) };
        { Code.index = 100; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 320; pos = 1; symbol = "<" }) };
        { Code.index = 101; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 320; pos = 2; symbol = "." }) };
        { Code.index = 102; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 332; pos = 1; symbol = "+" }) };
        { Code.index = 103; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 332; pos = 2; symbol = "+" }) };
        { Code.index = 104; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 332; pos = 3; symbol = "+" }) };
        { Code.index = 105; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 332; pos = 4; symbol = "." }) };
        { Code.index = 106; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 5; symbol = "-" }) };
        { Code.index = 107; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 6; symbol = "-" }) };
        { Code.index = 108; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 7; symbol = "-" }) };
        { Code.index = 109; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 8; symbol = "-" }) };
        { Code.index = 110; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 9; symbol = "-" }) };
        { Code.index = 111; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 10; symbol = "-" }) };
        { Code.index = 112; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 332; pos = 11; symbol = "." }) };
        { Code.index = 113; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 12; symbol = "-" }) };
        { Code.index = 114; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 13; symbol = "-" }) };
        { Code.index = 115; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 14; symbol = "-" }) };
        { Code.index = 116; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 15; symbol = "-" }) };
        { Code.index = 117; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 16; symbol = "-" }) };
        { Code.index = 118; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 17; symbol = "-" }) };
        { Code.index = 119; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 18; symbol = "-" }) };
        { Code.index = 120; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 19; symbol = "-" }) };
        { Code.index = 121; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 332; pos = 20; symbol = "." }) };
        { Code.index = 122; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 339; pos = 1; symbol = ">" }) };
        { Code.index = 123; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 339; pos = 2; symbol = ">" }) };
        { Code.index = 124; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 339; pos = 3; symbol = "+" }) };
        { Code.index = 125; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 339; pos = 4; symbol = "." }) };
        { Code.index = 126; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 350; pos = 1; symbol = ">" }) };
        { Code.index = 127; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 350; pos = 2; symbol = "+" }) };
        { Code.index = 128; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 350; pos = 3; symbol = "+" }) };
        { Code.index = 129; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 350; pos = 4; symbol = "." }) };
        { Code.index = 130; opcode = Code.Halt; arg = None; term = None }|];
      data_path =
      { Datapath.data_address = 6;
        data_memory =
        [|0; 0; 72; 100; 87; 33; 10; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0|];
        acc = 10; input_buffer = ['f'; 'o'; 'o'; '\n'];
        output_buffer =
        ['H'; 'e'; 'l'; 'l'; 'o'; ' '; 'W'; 'o'; 'r'; 'l'; 'd'; '!'; '\n'] };
      model_tick = 1532 } |}]

let%expect_test "test1" =
  Machines.Microcoded.machine ~limit:10000 ~log_limit:250
    ~program_fn:"examples/hello.json" ~input_fn:"examples/foo_input.txt";
  [%expect
    {|
    TICK:	0	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	Code.Jz
    TICK:	0	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	1	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	2	PC:	0	ADDR:	0	MEM_OUT:	0	ACC:	0	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	3	PC:	24	ADDR:	0	MEM_OUT:	0	ACC:	0	Code.Inc
    TICK:	3	PC:	24	ADDR:	0	MEM_OUT:	0	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	4	PC:	24	ADDR:	0	MEM_OUT:	0	ACC:	0	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	5	PC:	24	ADDR:	0	MEM_OUT:	0	ACC:	0	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	6	PC:	25	ADDR:	0	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	6	PC:	25	ADDR:	0	MEM_OUT:	1	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	7	PC:	25	ADDR:	0	MEM_OUT:	1	ACC:	0	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	8	PC:	25	ADDR:	0	MEM_OUT:	1	ACC:	1	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	9	PC:	26	ADDR:	0	MEM_OUT:	2	ACC:	1	Code.Inc
    TICK:	9	PC:	26	ADDR:	0	MEM_OUT:	2	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	10	PC:	26	ADDR:	0	MEM_OUT:	2	ACC:	1	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	11	PC:	26	ADDR:	0	MEM_OUT:	2	ACC:	2	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	12	PC:	27	ADDR:	0	MEM_OUT:	3	ACC:	2	Code.Inc
    TICK:	12	PC:	27	ADDR:	0	MEM_OUT:	3	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	13	PC:	27	ADDR:	0	MEM_OUT:	3	ACC:	2	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	14	PC:	27	ADDR:	0	MEM_OUT:	3	ACC:	3	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	15	PC:	28	ADDR:	0	MEM_OUT:	4	ACC:	3	Code.Inc
    TICK:	15	PC:	28	ADDR:	0	MEM_OUT:	4	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	16	PC:	28	ADDR:	0	MEM_OUT:	4	ACC:	3	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	17	PC:	28	ADDR:	0	MEM_OUT:	4	ACC:	4	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	18	PC:	29	ADDR:	0	MEM_OUT:	5	ACC:	4	Code.Inc
    TICK:	18	PC:	29	ADDR:	0	MEM_OUT:	5	ACC:	4	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	19	PC:	29	ADDR:	0	MEM_OUT:	5	ACC:	4	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	20	PC:	29	ADDR:	0	MEM_OUT:	5	ACC:	5	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	21	PC:	30	ADDR:	0	MEM_OUT:	6	ACC:	5	Code.Inc
    TICK:	21	PC:	30	ADDR:	0	MEM_OUT:	6	ACC:	5	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	22	PC:	30	ADDR:	0	MEM_OUT:	6	ACC:	5	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	23	PC:	30	ADDR:	0	MEM_OUT:	6	ACC:	6	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	24	PC:	31	ADDR:	0	MEM_OUT:	7	ACC:	6	Code.Inc
    TICK:	24	PC:	31	ADDR:	0	MEM_OUT:	7	ACC:	6	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	25	PC:	31	ADDR:	0	MEM_OUT:	7	ACC:	6	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	26	PC:	31	ADDR:	0	MEM_OUT:	7	ACC:	7	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	27	PC:	32	ADDR:	0	MEM_OUT:	8	ACC:	7	Code.Jz
    TICK:	27	PC:	32	ADDR:	0	MEM_OUT:	8	ACC:	7	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	28	PC:	32	ADDR:	0	MEM_OUT:	8	ACC:	7	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	29	PC:	32	ADDR:	0	MEM_OUT:	8	ACC:	8	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	30	PC:	33	ADDR:	0	MEM_OUT:	8	ACC:	8	Code.Right
    TICK:	30	PC:	33	ADDR:	0	MEM_OUT:	8	ACC:	8	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	31	PC:	33	ADDR:	0	MEM_OUT:	8	ACC:	8	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	32	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	8	Code.Inc
    TICK:	32	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	8	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	33	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	8	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	34	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	0	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	35	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	35	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	36	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	37	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	1	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	38	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Code.Inc
    TICK:	38	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	39	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	40	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	2	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	41	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Code.Inc
    TICK:	41	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	42	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	43	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	3	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	44	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Code.Jz
    TICK:	44	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	45	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	46	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	4	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	47	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Code.Right
    TICK:	47	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	48	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	49	PC:	40	ADDR:	2	MEM_OUT:	0	ACC:	4	Code.Inc
    TICK:	49	PC:	40	ADDR:	2	MEM_OUT:	0	ACC:	4	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	50	PC:	40	ADDR:	2	MEM_OUT:	0	ACC:	4	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	51	PC:	40	ADDR:	2	MEM_OUT:	0	ACC:	0	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	52	PC:	41	ADDR:	2	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	52	PC:	41	ADDR:	2	MEM_OUT:	1	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	53	PC:	41	ADDR:	2	MEM_OUT:	1	ACC:	0	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	54	PC:	41	ADDR:	2	MEM_OUT:	1	ACC:	1	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	55	PC:	42	ADDR:	2	MEM_OUT:	2	ACC:	1	Code.Right
    TICK:	55	PC:	42	ADDR:	2	MEM_OUT:	2	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	56	PC:	42	ADDR:	2	MEM_OUT:	2	ACC:	1	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	57	PC:	43	ADDR:	3	MEM_OUT:	0	ACC:	1	Code.Inc
    TICK:	57	PC:	43	ADDR:	3	MEM_OUT:	0	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	58	PC:	43	ADDR:	3	MEM_OUT:	0	ACC:	1	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	59	PC:	43	ADDR:	3	MEM_OUT:	0	ACC:	0	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	60	PC:	44	ADDR:	3	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	60	PC:	44	ADDR:	3	MEM_OUT:	1	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	61	PC:	44	ADDR:	3	MEM_OUT:	1	ACC:	0	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	62	PC:	44	ADDR:	3	MEM_OUT:	1	ACC:	1	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	63	PC:	45	ADDR:	3	MEM_OUT:	2	ACC:	1	Code.Inc
    TICK:	63	PC:	45	ADDR:	3	MEM_OUT:	2	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	64	PC:	45	ADDR:	3	MEM_OUT:	2	ACC:	1	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	65	PC:	45	ADDR:	3	MEM_OUT:	2	ACC:	2	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	66	PC:	46	ADDR:	3	MEM_OUT:	3	ACC:	2	Code.Right
    TICK:	66	PC:	46	ADDR:	3	MEM_OUT:	3	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	67	PC:	46	ADDR:	3	MEM_OUT:	3	ACC:	2	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	68	PC:	47	ADDR:	4	MEM_OUT:	0	ACC:	2	Code.Inc
    TICK:	68	PC:	47	ADDR:	4	MEM_OUT:	0	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	69	PC:	47	ADDR:	4	MEM_OUT:	0	ACC:	2	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	70	PC:	47	ADDR:	4	MEM_OUT:	0	ACC:	0	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	71	PC:	48	ADDR:	4	MEM_OUT:	1	ACC:	0	Code.Inc
    TICK:	71	PC:	48	ADDR:	4	MEM_OUT:	1	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	72	PC:	48	ADDR:	4	MEM_OUT:	1	ACC:	0	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	73	PC:	48	ADDR:	4	MEM_OUT:	1	ACC:	1	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	74	PC:	49	ADDR:	4	MEM_OUT:	2	ACC:	1	Code.Inc
    TICK:	74	PC:	49	ADDR:	4	MEM_OUT:	2	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	75	PC:	49	ADDR:	4	MEM_OUT:	2	ACC:	1	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	76	PC:	49	ADDR:	4	MEM_OUT:	2	ACC:	2	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	77	PC:	50	ADDR:	4	MEM_OUT:	3	ACC:	2	Code.Right
    TICK:	77	PC:	50	ADDR:	4	MEM_OUT:	3	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	78	PC:	50	ADDR:	4	MEM_OUT:	3	ACC:	2	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	79	PC:	51	ADDR:	5	MEM_OUT:	0	ACC:	2	Code.Inc
    TICK:	79	PC:	51	ADDR:	5	MEM_OUT:	0	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	80	PC:	51	ADDR:	5	MEM_OUT:	0	ACC:	2	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	81	PC:	51	ADDR:	5	MEM_OUT:	0	ACC:	0	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	82	PC:	52	ADDR:	5	MEM_OUT:	1	ACC:	0	Code.Left
    TICK:	82	PC:	52	ADDR:	5	MEM_OUT:	1	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	83	PC:	52	ADDR:	5	MEM_OUT:	1	ACC:	0	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	84	PC:	53	ADDR:	4	MEM_OUT:	3	ACC:	0	Code.Left
    TICK:	84	PC:	53	ADDR:	4	MEM_OUT:	3	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	85	PC:	53	ADDR:	4	MEM_OUT:	3	ACC:	0	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	86	PC:	54	ADDR:	3	MEM_OUT:	3	ACC:	0	Code.Left
    TICK:	86	PC:	54	ADDR:	3	MEM_OUT:	3	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	87	PC:	54	ADDR:	3	MEM_OUT:	3	ACC:	0	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	88	PC:	55	ADDR:	2	MEM_OUT:	2	ACC:	0	Code.Left
    TICK:	88	PC:	55	ADDR:	2	MEM_OUT:	2	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	89	PC:	55	ADDR:	2	MEM_OUT:	2	ACC:	0	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	90	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	0	Code.Dec
    TICK:	90	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	0	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	91	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	0	MPC:	5	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	92	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	4	MPC:	6	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Dec), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	93	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Code.Jmp
    TICK:	93	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	94	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	MPC:	11	SIGNALS:	(Microcoded.LatchPc Microcoded.Jmp), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	95	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Code.Jz
    TICK:	95	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	96	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	97	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	3	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	98	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Code.Right
    TICK:	98	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	99	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	100	PC:	40	ADDR:	2	MEM_OUT:	2	ACC:	3	Code.Inc
    TICK:	100	PC:	40	ADDR:	2	MEM_OUT:	2	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	101	PC:	40	ADDR:	2	MEM_OUT:	2	ACC:	3	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	102	PC:	40	ADDR:	2	MEM_OUT:	2	ACC:	2	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	103	PC:	41	ADDR:	2	MEM_OUT:	3	ACC:	2	Code.Inc
    TICK:	103	PC:	41	ADDR:	2	MEM_OUT:	3	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	104	PC:	41	ADDR:	2	MEM_OUT:	3	ACC:	2	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	105	PC:	41	ADDR:	2	MEM_OUT:	3	ACC:	3	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	106	PC:	42	ADDR:	2	MEM_OUT:	4	ACC:	3	Code.Right
    TICK:	106	PC:	42	ADDR:	2	MEM_OUT:	4	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	107	PC:	42	ADDR:	2	MEM_OUT:	4	ACC:	3	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	108	PC:	43	ADDR:	3	MEM_OUT:	3	ACC:	3	Code.Inc
    TICK:	108	PC:	43	ADDR:	3	MEM_OUT:	3	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	109	PC:	43	ADDR:	3	MEM_OUT:	3	ACC:	3	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	110	PC:	43	ADDR:	3	MEM_OUT:	3	ACC:	3	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	111	PC:	44	ADDR:	3	MEM_OUT:	4	ACC:	3	Code.Inc
    TICK:	111	PC:	44	ADDR:	3	MEM_OUT:	4	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	112	PC:	44	ADDR:	3	MEM_OUT:	4	ACC:	3	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	113	PC:	44	ADDR:	3	MEM_OUT:	4	ACC:	4	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	114	PC:	45	ADDR:	3	MEM_OUT:	5	ACC:	4	Code.Inc
    TICK:	114	PC:	45	ADDR:	3	MEM_OUT:	5	ACC:	4	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	115	PC:	45	ADDR:	3	MEM_OUT:	5	ACC:	4	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	116	PC:	45	ADDR:	3	MEM_OUT:	5	ACC:	5	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	117	PC:	46	ADDR:	3	MEM_OUT:	6	ACC:	5	Code.Right
    TICK:	117	PC:	46	ADDR:	3	MEM_OUT:	6	ACC:	5	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	118	PC:	46	ADDR:	3	MEM_OUT:	6	ACC:	5	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	119	PC:	47	ADDR:	4	MEM_OUT:	3	ACC:	5	Code.Inc
    TICK:	119	PC:	47	ADDR:	4	MEM_OUT:	3	ACC:	5	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	120	PC:	47	ADDR:	4	MEM_OUT:	3	ACC:	5	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	121	PC:	47	ADDR:	4	MEM_OUT:	3	ACC:	3	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	122	PC:	48	ADDR:	4	MEM_OUT:	4	ACC:	3	Code.Inc
    TICK:	122	PC:	48	ADDR:	4	MEM_OUT:	4	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	123	PC:	48	ADDR:	4	MEM_OUT:	4	ACC:	3	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	124	PC:	48	ADDR:	4	MEM_OUT:	4	ACC:	4	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	125	PC:	49	ADDR:	4	MEM_OUT:	5	ACC:	4	Code.Inc
    TICK:	125	PC:	49	ADDR:	4	MEM_OUT:	5	ACC:	4	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	126	PC:	49	ADDR:	4	MEM_OUT:	5	ACC:	4	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	127	PC:	49	ADDR:	4	MEM_OUT:	5	ACC:	5	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	128	PC:	50	ADDR:	4	MEM_OUT:	6	ACC:	5	Code.Right
    TICK:	128	PC:	50	ADDR:	4	MEM_OUT:	6	ACC:	5	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	129	PC:	50	ADDR:	4	MEM_OUT:	6	ACC:	5	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	130	PC:	51	ADDR:	5	MEM_OUT:	1	ACC:	5	Code.Inc
    TICK:	130	PC:	51	ADDR:	5	MEM_OUT:	1	ACC:	5	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	131	PC:	51	ADDR:	5	MEM_OUT:	1	ACC:	5	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	132	PC:	51	ADDR:	5	MEM_OUT:	1	ACC:	1	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	133	PC:	52	ADDR:	5	MEM_OUT:	2	ACC:	1	Code.Left
    TICK:	133	PC:	52	ADDR:	5	MEM_OUT:	2	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	134	PC:	52	ADDR:	5	MEM_OUT:	2	ACC:	1	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	135	PC:	53	ADDR:	4	MEM_OUT:	6	ACC:	1	Code.Left
    TICK:	135	PC:	53	ADDR:	4	MEM_OUT:	6	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	136	PC:	53	ADDR:	4	MEM_OUT:	6	ACC:	1	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	137	PC:	54	ADDR:	3	MEM_OUT:	6	ACC:	1	Code.Left
    TICK:	137	PC:	54	ADDR:	3	MEM_OUT:	6	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	138	PC:	54	ADDR:	3	MEM_OUT:	6	ACC:	1	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	139	PC:	55	ADDR:	2	MEM_OUT:	4	ACC:	1	Code.Left
    TICK:	139	PC:	55	ADDR:	2	MEM_OUT:	4	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	140	PC:	55	ADDR:	2	MEM_OUT:	4	ACC:	1	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	141	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	1	Code.Dec
    TICK:	141	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	142	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	1	MPC:	5	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	143	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	3	MPC:	6	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Dec), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	144	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Code.Jmp
    TICK:	144	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	145	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	MPC:	11	SIGNALS:	(Microcoded.LatchPc Microcoded.Jmp), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	146	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Code.Jz
    TICK:	146	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	147	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	148	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	2	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	149	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Code.Right
    TICK:	149	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	150	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	151	PC:	40	ADDR:	2	MEM_OUT:	4	ACC:	2	Code.Inc
    TICK:	151	PC:	40	ADDR:	2	MEM_OUT:	4	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	152	PC:	40	ADDR:	2	MEM_OUT:	4	ACC:	2	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	153	PC:	40	ADDR:	2	MEM_OUT:	4	ACC:	4	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	154	PC:	41	ADDR:	2	MEM_OUT:	5	ACC:	4	Code.Inc
    TICK:	154	PC:	41	ADDR:	2	MEM_OUT:	5	ACC:	4	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	155	PC:	41	ADDR:	2	MEM_OUT:	5	ACC:	4	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	156	PC:	41	ADDR:	2	MEM_OUT:	5	ACC:	5	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	157	PC:	42	ADDR:	2	MEM_OUT:	6	ACC:	5	Code.Right
    TICK:	157	PC:	42	ADDR:	2	MEM_OUT:	6	ACC:	5	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	158	PC:	42	ADDR:	2	MEM_OUT:	6	ACC:	5	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	159	PC:	43	ADDR:	3	MEM_OUT:	6	ACC:	5	Code.Inc
    TICK:	159	PC:	43	ADDR:	3	MEM_OUT:	6	ACC:	5	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	160	PC:	43	ADDR:	3	MEM_OUT:	6	ACC:	5	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	161	PC:	43	ADDR:	3	MEM_OUT:	6	ACC:	6	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	162	PC:	44	ADDR:	3	MEM_OUT:	7	ACC:	6	Code.Inc
    TICK:	162	PC:	44	ADDR:	3	MEM_OUT:	7	ACC:	6	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	163	PC:	44	ADDR:	3	MEM_OUT:	7	ACC:	6	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	164	PC:	44	ADDR:	3	MEM_OUT:	7	ACC:	7	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	165	PC:	45	ADDR:	3	MEM_OUT:	8	ACC:	7	Code.Inc
    TICK:	165	PC:	45	ADDR:	3	MEM_OUT:	8	ACC:	7	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	166	PC:	45	ADDR:	3	MEM_OUT:	8	ACC:	7	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	167	PC:	45	ADDR:	3	MEM_OUT:	8	ACC:	8	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	168	PC:	46	ADDR:	3	MEM_OUT:	9	ACC:	8	Code.Right
    TICK:	168	PC:	46	ADDR:	3	MEM_OUT:	9	ACC:	8	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	169	PC:	46	ADDR:	3	MEM_OUT:	9	ACC:	8	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	170	PC:	47	ADDR:	4	MEM_OUT:	6	ACC:	8	Code.Inc
    TICK:	170	PC:	47	ADDR:	4	MEM_OUT:	6	ACC:	8	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	171	PC:	47	ADDR:	4	MEM_OUT:	6	ACC:	8	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	172	PC:	47	ADDR:	4	MEM_OUT:	6	ACC:	6	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	173	PC:	48	ADDR:	4	MEM_OUT:	7	ACC:	6	Code.Inc
    TICK:	173	PC:	48	ADDR:	4	MEM_OUT:	7	ACC:	6	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	174	PC:	48	ADDR:	4	MEM_OUT:	7	ACC:	6	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	175	PC:	48	ADDR:	4	MEM_OUT:	7	ACC:	7	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	176	PC:	49	ADDR:	4	MEM_OUT:	8	ACC:	7	Code.Inc
    TICK:	176	PC:	49	ADDR:	4	MEM_OUT:	8	ACC:	7	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	177	PC:	49	ADDR:	4	MEM_OUT:	8	ACC:	7	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	178	PC:	49	ADDR:	4	MEM_OUT:	8	ACC:	8	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	179	PC:	50	ADDR:	4	MEM_OUT:	9	ACC:	8	Code.Right
    TICK:	179	PC:	50	ADDR:	4	MEM_OUT:	9	ACC:	8	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	180	PC:	50	ADDR:	4	MEM_OUT:	9	ACC:	8	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	181	PC:	51	ADDR:	5	MEM_OUT:	2	ACC:	8	Code.Inc
    TICK:	181	PC:	51	ADDR:	5	MEM_OUT:	2	ACC:	8	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	182	PC:	51	ADDR:	5	MEM_OUT:	2	ACC:	8	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	183	PC:	51	ADDR:	5	MEM_OUT:	2	ACC:	2	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	184	PC:	52	ADDR:	5	MEM_OUT:	3	ACC:	2	Code.Left
    TICK:	184	PC:	52	ADDR:	5	MEM_OUT:	3	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	185	PC:	52	ADDR:	5	MEM_OUT:	3	ACC:	2	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	186	PC:	53	ADDR:	4	MEM_OUT:	9	ACC:	2	Code.Left
    TICK:	186	PC:	53	ADDR:	4	MEM_OUT:	9	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	187	PC:	53	ADDR:	4	MEM_OUT:	9	ACC:	2	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	188	PC:	54	ADDR:	3	MEM_OUT:	9	ACC:	2	Code.Left
    TICK:	188	PC:	54	ADDR:	3	MEM_OUT:	9	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	189	PC:	54	ADDR:	3	MEM_OUT:	9	ACC:	2	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	190	PC:	55	ADDR:	2	MEM_OUT:	6	ACC:	2	Code.Left
    TICK:	190	PC:	55	ADDR:	2	MEM_OUT:	6	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	191	PC:	55	ADDR:	2	MEM_OUT:	6	ACC:	2	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	192	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	2	Code.Dec
    TICK:	192	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	193	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	2	MPC:	5	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	194	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	2	MPC:	6	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Dec), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	195	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Code.Jmp
    TICK:	195	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	196	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	MPC:	11	SIGNALS:	(Microcoded.LatchPc Microcoded.Jmp), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	197	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Code.Jz
    TICK:	197	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	198	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	199	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	1	MPC:	13	SIGNALS:	(Microcoded.LatchPc Microcoded.Jz), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	200	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Code.Right
    TICK:	200	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	201	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	202	PC:	40	ADDR:	2	MEM_OUT:	6	ACC:	1	Code.Inc
    TICK:	202	PC:	40	ADDR:	2	MEM_OUT:	6	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	203	PC:	40	ADDR:	2	MEM_OUT:	6	ACC:	1	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	204	PC:	40	ADDR:	2	MEM_OUT:	6	ACC:	6	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	205	PC:	41	ADDR:	2	MEM_OUT:	7	ACC:	6	Code.Inc
    TICK:	205	PC:	41	ADDR:	2	MEM_OUT:	7	ACC:	6	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	206	PC:	41	ADDR:	2	MEM_OUT:	7	ACC:	6	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	207	PC:	41	ADDR:	2	MEM_OUT:	7	ACC:	7	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	208	PC:	42	ADDR:	2	MEM_OUT:	8	ACC:	7	Code.Right
    TICK:	208	PC:	42	ADDR:	2	MEM_OUT:	8	ACC:	7	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	209	PC:	42	ADDR:	2	MEM_OUT:	8	ACC:	7	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	210	PC:	43	ADDR:	3	MEM_OUT:	9	ACC:	7	Code.Inc
    TICK:	210	PC:	43	ADDR:	3	MEM_OUT:	9	ACC:	7	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	211	PC:	43	ADDR:	3	MEM_OUT:	9	ACC:	7	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	212	PC:	43	ADDR:	3	MEM_OUT:	9	ACC:	9	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	213	PC:	44	ADDR:	3	MEM_OUT:	10	ACC:	9	Code.Inc
    TICK:	213	PC:	44	ADDR:	3	MEM_OUT:	10	ACC:	9	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	214	PC:	44	ADDR:	3	MEM_OUT:	10	ACC:	9	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	215	PC:	44	ADDR:	3	MEM_OUT:	10	ACC:	10	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	216	PC:	45	ADDR:	3	MEM_OUT:	11	ACC:	10	Code.Inc
    TICK:	216	PC:	45	ADDR:	3	MEM_OUT:	11	ACC:	10	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	217	PC:	45	ADDR:	3	MEM_OUT:	11	ACC:	10	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	218	PC:	45	ADDR:	3	MEM_OUT:	11	ACC:	11	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	219	PC:	46	ADDR:	3	MEM_OUT:	12	ACC:	11	Code.Right
    TICK:	219	PC:	46	ADDR:	3	MEM_OUT:	12	ACC:	11	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	220	PC:	46	ADDR:	3	MEM_OUT:	12	ACC:	11	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	221	PC:	47	ADDR:	4	MEM_OUT:	9	ACC:	11	Code.Inc
    TICK:	221	PC:	47	ADDR:	4	MEM_OUT:	9	ACC:	11	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	222	PC:	47	ADDR:	4	MEM_OUT:	9	ACC:	11	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	223	PC:	47	ADDR:	4	MEM_OUT:	9	ACC:	9	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	224	PC:	48	ADDR:	4	MEM_OUT:	10	ACC:	9	Code.Inc
    TICK:	224	PC:	48	ADDR:	4	MEM_OUT:	10	ACC:	9	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	225	PC:	48	ADDR:	4	MEM_OUT:	10	ACC:	9	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	226	PC:	48	ADDR:	4	MEM_OUT:	10	ACC:	10	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	227	PC:	49	ADDR:	4	MEM_OUT:	11	ACC:	10	Code.Inc
    TICK:	227	PC:	49	ADDR:	4	MEM_OUT:	11	ACC:	10	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	228	PC:	49	ADDR:	4	MEM_OUT:	11	ACC:	10	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	229	PC:	49	ADDR:	4	MEM_OUT:	11	ACC:	11	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	230	PC:	50	ADDR:	4	MEM_OUT:	12	ACC:	11	Code.Right
    TICK:	230	PC:	50	ADDR:	4	MEM_OUT:	12	ACC:	11	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	231	PC:	50	ADDR:	4	MEM_OUT:	12	ACC:	11	MPC:	2	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Right), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	232	PC:	51	ADDR:	5	MEM_OUT:	3	ACC:	11	Code.Inc
    TICK:	232	PC:	51	ADDR:	5	MEM_OUT:	3	ACC:	11	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	233	PC:	51	ADDR:	5	MEM_OUT:	3	ACC:	11	MPC:	3	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	234	PC:	51	ADDR:	5	MEM_OUT:	3	ACC:	3	MPC:	4	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Inc), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	235	PC:	52	ADDR:	5	MEM_OUT:	4	ACC:	3	Code.Left
    TICK:	235	PC:	52	ADDR:	5	MEM_OUT:	4	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	236	PC:	52	ADDR:	5	MEM_OUT:	4	ACC:	3	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	237	PC:	53	ADDR:	4	MEM_OUT:	12	ACC:	3	Code.Left
    TICK:	237	PC:	53	ADDR:	4	MEM_OUT:	12	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	238	PC:	53	ADDR:	4	MEM_OUT:	12	ACC:	3	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	239	PC:	54	ADDR:	3	MEM_OUT:	12	ACC:	3	Code.Left
    TICK:	239	PC:	54	ADDR:	3	MEM_OUT:	12	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	240	PC:	54	ADDR:	3	MEM_OUT:	12	ACC:	3	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	241	PC:	55	ADDR:	2	MEM_OUT:	8	ACC:	3	Code.Left
    TICK:	241	PC:	55	ADDR:	2	MEM_OUT:	8	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	242	PC:	55	ADDR:	2	MEM_OUT:	8	ACC:	3	MPC:	1	SIGNALS:	(Microcoded.LatchDataAddr Datapath.Left), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	243	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	3	Code.Dec
    TICK:	243	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	3	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	244	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	3	MPC:	5	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    TICK:	245	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	1	MPC:	6	SIGNALS:	(Microcoded.DataMemoryWr Datapath.Dec), (Microcoded.LatchPc Microcoded.Next), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	246	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Code.Jmp
    TICK:	246	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	247	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	MPC:	11	SIGNALS:	(Microcoded.LatchPc Microcoded.Jmp), (Microcoded.LatchMpc Microcoded.Zero)
    TICK:	248	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Code.Jz
    TICK:	248	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	MPC:	0	SIGNALS:	(Microcoded.LatchMpc Microcoded.Opcode)
    TICK:	249	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	MPC:	12	SIGNALS:	Microcoded.LatchAcc, (Microcoded.LatchMpc Microcoded.Next)
    Failure("Halted.")
    { Microcoded.pc = 130;
      program =
      [|{ Code.index = 23; opcode = Code.Jz; arg = (Some 24);
          term = (Some { Code.line = 1; pos = 1; symbol = "[" }) };
        { Code.index = 1; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 12; pos = 7; symbol = "," }) };
        { Code.index = 2; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 19; pos = 11; symbol = "." }) };
        { Code.index = 5; opcode = Code.Jz; arg = (Some 6);
          term = (Some { Code.line = 20; pos = 1; symbol = "[" }) };
        { Code.index = 4; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 24; pos = 9; symbol = "." }) };
        { Code.index = 5; opcode = Code.Jmp; arg = (Some 3);
          term = (Some { Code.line = 24; pos = 10; symbol = "]" }) };
        { Code.index = 6; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 31; pos = 6; symbol = "," }) };
        { Code.index = 7; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 53; pos = 11; symbol = "." }) };
        { Code.index = 8; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 55; pos = 2; symbol = "." }) };
        { Code.index = 9; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 55; pos = 4; symbol = "," }) };
        { Code.index = 10; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 56; pos = 2; symbol = "," }) };
        { Code.index = 11; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 56; pos = 4; symbol = "," }) };
        { Code.index = 12; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 57; pos = 2; symbol = "+" }) };
        { Code.index = 13; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 57; pos = 4; symbol = "," }) };
        { Code.index = 14; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 58; pos = 2; symbol = "-" }) };
        { Code.index = 15; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 58; pos = 4; symbol = "," }) };
        { Code.index = 16; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 59; pos = 2; symbol = "<" }) };
        { Code.index = 17; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 61; pos = 2; symbol = ">" }) };
        { Code.index = 18; opcode = Code.Input; arg = None;
          term = (Some { Code.line = 65; pos = 8; symbol = "," }) };
        { Code.index = 20; opcode = Code.Jz; arg = (Some 21);
          term = (Some { Code.line = 67; pos = 2; symbol = "[" }) };
        { Code.index = 20; opcode = Code.Jmp; arg = (Some 19);
          term = (Some { Code.line = 69; pos = 2; symbol = "]" }) };
        { Code.index = 21; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 75; pos = 9; symbol = "." }) };
        { Code.index = 22; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 103; pos = 8; symbol = "." }) };
        { Code.index = 23; opcode = Code.Jmp; arg = (Some 0);
          term = (Some { Code.line = 104; pos = 1; symbol = "]" }) };
        { Code.index = 24; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 1; symbol = "+" }) };
        { Code.index = 25; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 2; symbol = "+" }) };
        { Code.index = 26; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 3; symbol = "+" }) };
        { Code.index = 27; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 4; symbol = "+" }) };
        { Code.index = 28; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 5; symbol = "+" }) };
        { Code.index = 29; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 6; symbol = "+" }) };
        { Code.index = 30; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 7; symbol = "+" }) };
        { Code.index = 31; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 105; pos = 8; symbol = "+" }) };
        { Code.index = 72; opcode = Code.Jz; arg = (Some 73);
          term = (Some { Code.line = 111; pos = 1; symbol = "[" }) };
        { Code.index = 33; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 112; pos = 1; symbol = ">" }) };
        { Code.index = 34; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 112; pos = 2; symbol = "+" }) };
        { Code.index = 35; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 112; pos = 3; symbol = "+" }) };
        { Code.index = 36; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 112; pos = 4; symbol = "+" }) };
        { Code.index = 37; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 112; pos = 5; symbol = "+" }) };
        { Code.index = 57; opcode = Code.Jz; arg = (Some 58);
          term = (Some { Code.line = 126; pos = 1; symbol = "[" }) };
        { Code.index = 39; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 136; pos = 1; symbol = ">" }) };
        { Code.index = 40; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 136; pos = 2; symbol = "+" }) };
        { Code.index = 41; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 136; pos = 3; symbol = "+" }) };
        { Code.index = 42; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 142; pos = 1; symbol = ">" }) };
        { Code.index = 43; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 142; pos = 2; symbol = "+" }) };
        { Code.index = 44; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 142; pos = 3; symbol = "+" }) };
        { Code.index = 45; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 142; pos = 4; symbol = "+" }) };
        { Code.index = 46; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 148; pos = 1; symbol = ">" }) };
        { Code.index = 47; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 148; pos = 2; symbol = "+" }) };
        { Code.index = 48; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 148; pos = 3; symbol = "+" }) };
        { Code.index = 49; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 148; pos = 4; symbol = "+" }) };
        { Code.index = 50; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 154; pos = 1; symbol = ">" }) };
        { Code.index = 51; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 154; pos = 2; symbol = "+" }) };
        { Code.index = 52; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 160; pos = 1; symbol = "<" }) };
        { Code.index = 53; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 160; pos = 2; symbol = "<" }) };
        { Code.index = 54; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 160; pos = 3; symbol = "<" }) };
        { Code.index = 55; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 160; pos = 4; symbol = "<" }) };
        { Code.index = 56; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 160; pos = 5; symbol = "-" }) };
        { Code.index = 57; opcode = Code.Jmp; arg = (Some 38);
          term = (Some { Code.line = 168; pos = 1; symbol = "]" }) };
        { Code.index = 58; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 180; pos = 1; symbol = ">" }) };
        { Code.index = 59; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 180; pos = 2; symbol = "+" }) };
        { Code.index = 60; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 186; pos = 1; symbol = ">" }) };
        { Code.index = 61; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 186; pos = 2; symbol = "+" }) };
        { Code.index = 62; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 192; pos = 1; symbol = ">" }) };
        { Code.index = 63; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 192; pos = 2; symbol = "-" }) };
        { Code.index = 64; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 198; pos = 1; symbol = ">" }) };
        { Code.index = 65; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 198; pos = 2; symbol = ">" }) };
        { Code.index = 66; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 198; pos = 3; symbol = "+" }) };
        { Code.index = 69; opcode = Code.Jz; arg = (Some 70);
          term = (Some { Code.line = 204; pos = 1; symbol = "[" }) };
        { Code.index = 68; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 204; pos = 2; symbol = "<" }) };
        { Code.index = 69; opcode = Code.Jmp; arg = (Some 67);
          term = (Some { Code.line = 204; pos = 3; symbol = "]" }) };
        { Code.index = 70; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 226; pos = 1; symbol = "<" }) };
        { Code.index = 71; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 226; pos = 2; symbol = "-" }) };
        { Code.index = 72; opcode = Code.Jmp; arg = (Some 32);
          term = (Some { Code.line = 234; pos = 1; symbol = "]" }) };
        { Code.index = 73; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 272; pos = 1; symbol = ">" }) };
        { Code.index = 74; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 272; pos = 2; symbol = ">" }) };
        { Code.index = 75; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 272; pos = 3; symbol = "." }) };
        { Code.index = 76; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 281; pos = 1; symbol = ">" }) };
        { Code.index = 77; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 281; pos = 2; symbol = "-" }) };
        { Code.index = 78; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 281; pos = 3; symbol = "-" }) };
        { Code.index = 79; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 281; pos = 4; symbol = "-" }) };
        { Code.index = 80; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 281; pos = 5; symbol = "." }) };
        { Code.index = 81; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 1; symbol = "+" }) };
        { Code.index = 82; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 2; symbol = "+" }) };
        { Code.index = 83; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 3; symbol = "+" }) };
        { Code.index = 84; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 4; symbol = "+" }) };
        { Code.index = 85; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 5; symbol = "+" }) };
        { Code.index = 86; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 6; symbol = "+" }) };
        { Code.index = 87; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 7; symbol = "+" }) };
        { Code.index = 88; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 293; pos = 8; symbol = "." }) };
        { Code.index = 89; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 293; pos = 9; symbol = "." }) };
        { Code.index = 90; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 10; symbol = "+" }) };
        { Code.index = 91; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 11; symbol = "+" }) };
        { Code.index = 92; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 293; pos = 12; symbol = "+" }) };
        { Code.index = 93; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 293; pos = 13; symbol = "." }) };
        { Code.index = 94; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 300; pos = 1; symbol = ">" }) };
        { Code.index = 95; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 300; pos = 2; symbol = ">" }) };
        { Code.index = 96; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 300; pos = 3; symbol = "." }) };
        { Code.index = 97; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 308; pos = 1; symbol = "<" }) };
        { Code.index = 98; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 308; pos = 2; symbol = "-" }) };
        { Code.index = 99; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 308; pos = 3; symbol = "." }) };
        { Code.index = 100; opcode = Code.Left; arg = None;
          term = (Some { Code.line = 320; pos = 1; symbol = "<" }) };
        { Code.index = 101; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 320; pos = 2; symbol = "." }) };
        { Code.index = 102; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 332; pos = 1; symbol = "+" }) };
        { Code.index = 103; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 332; pos = 2; symbol = "+" }) };
        { Code.index = 104; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 332; pos = 3; symbol = "+" }) };
        { Code.index = 105; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 332; pos = 4; symbol = "." }) };
        { Code.index = 106; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 5; symbol = "-" }) };
        { Code.index = 107; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 6; symbol = "-" }) };
        { Code.index = 108; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 7; symbol = "-" }) };
        { Code.index = 109; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 8; symbol = "-" }) };
        { Code.index = 110; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 9; symbol = "-" }) };
        { Code.index = 111; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 10; symbol = "-" }) };
        { Code.index = 112; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 332; pos = 11; symbol = "." }) };
        { Code.index = 113; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 12; symbol = "-" }) };
        { Code.index = 114; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 13; symbol = "-" }) };
        { Code.index = 115; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 14; symbol = "-" }) };
        { Code.index = 116; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 15; symbol = "-" }) };
        { Code.index = 117; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 16; symbol = "-" }) };
        { Code.index = 118; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 17; symbol = "-" }) };
        { Code.index = 119; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 18; symbol = "-" }) };
        { Code.index = 120; opcode = Code.Dec; arg = None;
          term = (Some { Code.line = 332; pos = 19; symbol = "-" }) };
        { Code.index = 121; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 332; pos = 20; symbol = "." }) };
        { Code.index = 122; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 339; pos = 1; symbol = ">" }) };
        { Code.index = 123; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 339; pos = 2; symbol = ">" }) };
        { Code.index = 124; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 339; pos = 3; symbol = "+" }) };
        { Code.index = 125; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 339; pos = 4; symbol = "." }) };
        { Code.index = 126; opcode = Code.Right; arg = None;
          term = (Some { Code.line = 350; pos = 1; symbol = ">" }) };
        { Code.index = 127; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 350; pos = 2; symbol = "+" }) };
        { Code.index = 128; opcode = Code.Inc; arg = None;
          term = (Some { Code.line = 350; pos = 3; symbol = "+" }) };
        { Code.index = 129; opcode = Code.Print; arg = None;
          term = (Some { Code.line = 350; pos = 4; symbol = "." }) };
        { Code.index = 130; opcode = Code.Halt; arg = None; term = None }|];
      mpc = 14; mpc_of_opcode = <fun>;
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
      { Datapath.data_address = 6;
        data_memory =
        [|0; 0; 72; 100; 87; 33; 10; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0|];
        acc = 10; input_buffer = ['f'; 'o'; 'o'; '\n'];
        output_buffer =
        ['H'; 'e'; 'l'; 'l'; 'o'; ' '; 'W'; 'o'; 'r'; 'l'; 'd'; '!'; '\n'] };
      model_tick = 2520 } |}]
