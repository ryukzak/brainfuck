let%expect_test "test1" =
  Machine.machine 1000 "examples/hello.json" "examples/foo_input.txt";
  [%expect
    {|
    TICK:	2	PC:	24	ADDR:	0	MEM_OUT:	0	ACC:	0	Machine.Inc
    TICK:	4	PC:	25	ADDR:	0	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	6	PC:	26	ADDR:	0	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	8	PC:	27	ADDR:	0	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	10	PC:	28	ADDR:	0	MEM_OUT:	4	ACC:	3	Machine.Inc
    TICK:	12	PC:	29	ADDR:	0	MEM_OUT:	5	ACC:	4	Machine.Inc
    TICK:	14	PC:	30	ADDR:	0	MEM_OUT:	6	ACC:	5	Machine.Inc
    TICK:	16	PC:	31	ADDR:	0	MEM_OUT:	7	ACC:	6	Machine.Inc
    TICK:	18	PC:	32	ADDR:	0	MEM_OUT:	8	ACC:	7	Machine.Jz
    TICK:	20	PC:	33	ADDR:	0	MEM_OUT:	8	ACC:	8	Machine.Right
    TICK:	21	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	8	Machine.Inc
    TICK:	23	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	25	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	27	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	29	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Machine.Jz
    TICK:	31	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Machine.Right
    TICK:	32	PC:	40	ADDR:	2	MEM_OUT:	0	ACC:	4	Machine.Inc
    TICK:	34	PC:	41	ADDR:	2	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	36	PC:	42	ADDR:	2	MEM_OUT:	2	ACC:	1	Machine.Right
    TICK:	37	PC:	43	ADDR:	3	MEM_OUT:	0	ACC:	1	Machine.Inc
    TICK:	39	PC:	44	ADDR:	3	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	41	PC:	45	ADDR:	3	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	43	PC:	46	ADDR:	3	MEM_OUT:	3	ACC:	2	Machine.Right
    TICK:	44	PC:	47	ADDR:	4	MEM_OUT:	0	ACC:	2	Machine.Inc
    TICK:	46	PC:	48	ADDR:	4	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	48	PC:	49	ADDR:	4	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	50	PC:	50	ADDR:	4	MEM_OUT:	3	ACC:	2	Machine.Right
    TICK:	51	PC:	51	ADDR:	5	MEM_OUT:	0	ACC:	2	Machine.Inc
    TICK:	53	PC:	52	ADDR:	5	MEM_OUT:	1	ACC:	0	Machine.Left
    TICK:	54	PC:	53	ADDR:	4	MEM_OUT:	3	ACC:	0	Machine.Left
    TICK:	55	PC:	54	ADDR:	3	MEM_OUT:	3	ACC:	0	Machine.Left
    TICK:	56	PC:	55	ADDR:	2	MEM_OUT:	2	ACC:	0	Machine.Left
    TICK:	57	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	0	Machine.Dec
    TICK:	59	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jmp
    TICK:	60	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jz
    TICK:	62	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Machine.Right
    TICK:	63	PC:	40	ADDR:	2	MEM_OUT:	2	ACC:	3	Machine.Inc
    TICK:	65	PC:	41	ADDR:	2	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	67	PC:	42	ADDR:	2	MEM_OUT:	4	ACC:	3	Machine.Right
    TICK:	68	PC:	43	ADDR:	3	MEM_OUT:	3	ACC:	3	Machine.Inc
    TICK:	70	PC:	44	ADDR:	3	MEM_OUT:	4	ACC:	3	Machine.Inc
    TICK:	72	PC:	45	ADDR:	3	MEM_OUT:	5	ACC:	4	Machine.Inc
    TICK:	74	PC:	46	ADDR:	3	MEM_OUT:	6	ACC:	5	Machine.Right
    TICK:	75	PC:	47	ADDR:	4	MEM_OUT:	3	ACC:	5	Machine.Inc
    TICK:	77	PC:	48	ADDR:	4	MEM_OUT:	4	ACC:	3	Machine.Inc
    TICK:	79	PC:	49	ADDR:	4	MEM_OUT:	5	ACC:	4	Machine.Inc
    TICK:	81	PC:	50	ADDR:	4	MEM_OUT:	6	ACC:	5	Machine.Right
    TICK:	82	PC:	51	ADDR:	5	MEM_OUT:	1	ACC:	5	Machine.Inc
    TICK:	84	PC:	52	ADDR:	5	MEM_OUT:	2	ACC:	1	Machine.Left
    TICK:	85	PC:	53	ADDR:	4	MEM_OUT:	6	ACC:	1	Machine.Left
    TICK:	86	PC:	54	ADDR:	3	MEM_OUT:	6	ACC:	1	Machine.Left
    TICK:	87	PC:	55	ADDR:	2	MEM_OUT:	4	ACC:	1	Machine.Left
    TICK:	88	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	1	Machine.Dec
    TICK:	90	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jmp
    TICK:	91	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jz
    TICK:	93	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Machine.Right
    TICK:	94	PC:	40	ADDR:	2	MEM_OUT:	4	ACC:	2	Machine.Inc
    TICK:	96	PC:	41	ADDR:	2	MEM_OUT:	5	ACC:	4	Machine.Inc
    TICK:	98	PC:	42	ADDR:	2	MEM_OUT:	6	ACC:	5	Machine.Right
    TICK:	99	PC:	43	ADDR:	3	MEM_OUT:	6	ACC:	5	Machine.Inc
    TICK:	101	PC:	44	ADDR:	3	MEM_OUT:	7	ACC:	6	Machine.Inc
    TICK:	103	PC:	45	ADDR:	3	MEM_OUT:	8	ACC:	7	Machine.Inc
    TICK:	105	PC:	46	ADDR:	3	MEM_OUT:	9	ACC:	8	Machine.Right
    TICK:	106	PC:	47	ADDR:	4	MEM_OUT:	6	ACC:	8	Machine.Inc
    TICK:	108	PC:	48	ADDR:	4	MEM_OUT:	7	ACC:	6	Machine.Inc
    TICK:	110	PC:	49	ADDR:	4	MEM_OUT:	8	ACC:	7	Machine.Inc
    TICK:	112	PC:	50	ADDR:	4	MEM_OUT:	9	ACC:	8	Machine.Right
    TICK:	113	PC:	51	ADDR:	5	MEM_OUT:	2	ACC:	8	Machine.Inc
    TICK:	115	PC:	52	ADDR:	5	MEM_OUT:	3	ACC:	2	Machine.Left
    TICK:	116	PC:	53	ADDR:	4	MEM_OUT:	9	ACC:	2	Machine.Left
    TICK:	117	PC:	54	ADDR:	3	MEM_OUT:	9	ACC:	2	Machine.Left
    TICK:	118	PC:	55	ADDR:	2	MEM_OUT:	6	ACC:	2	Machine.Left
    TICK:	119	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	2	Machine.Dec
    TICK:	121	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jmp
    TICK:	122	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jz
    TICK:	124	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Machine.Right
    TICK:	125	PC:	40	ADDR:	2	MEM_OUT:	6	ACC:	1	Machine.Inc
    TICK:	127	PC:	41	ADDR:	2	MEM_OUT:	7	ACC:	6	Machine.Inc
    TICK:	129	PC:	42	ADDR:	2	MEM_OUT:	8	ACC:	7	Machine.Right
    TICK:	130	PC:	43	ADDR:	3	MEM_OUT:	9	ACC:	7	Machine.Inc
    TICK:	132	PC:	44	ADDR:	3	MEM_OUT:	10	ACC:	9	Machine.Inc
    TICK:	134	PC:	45	ADDR:	3	MEM_OUT:	11	ACC:	10	Machine.Inc
    TICK:	136	PC:	46	ADDR:	3	MEM_OUT:	12	ACC:	11	Machine.Right
    TICK:	137	PC:	47	ADDR:	4	MEM_OUT:	9	ACC:	11	Machine.Inc
    TICK:	139	PC:	48	ADDR:	4	MEM_OUT:	10	ACC:	9	Machine.Inc
    TICK:	141	PC:	49	ADDR:	4	MEM_OUT:	11	ACC:	10	Machine.Inc
    TICK:	143	PC:	50	ADDR:	4	MEM_OUT:	12	ACC:	11	Machine.Right
    TICK:	144	PC:	51	ADDR:	5	MEM_OUT:	3	ACC:	11	Machine.Inc
    TICK:	146	PC:	52	ADDR:	5	MEM_OUT:	4	ACC:	3	Machine.Left
    TICK:	147	PC:	53	ADDR:	4	MEM_OUT:	12	ACC:	3	Machine.Left
    TICK:	148	PC:	54	ADDR:	3	MEM_OUT:	12	ACC:	3	Machine.Left
    TICK:	149	PC:	55	ADDR:	2	MEM_OUT:	8	ACC:	3	Machine.Left
    TICK:	150	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	3	Machine.Dec
    TICK:	152	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jmp
    TICK:	153	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jz
    TICK:	155	PC:	58	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	156	PC:	59	ADDR:	2	MEM_OUT:	8	ACC:	0	Machine.Inc
    TICK:	158	PC:	60	ADDR:	2	MEM_OUT:	9	ACC:	8	Machine.Right
    TICK:	159	PC:	61	ADDR:	3	MEM_OUT:	12	ACC:	8	Machine.Inc
    TICK:	161	PC:	62	ADDR:	3	MEM_OUT:	13	ACC:	12	Machine.Right
    TICK:	162	PC:	63	ADDR:	4	MEM_OUT:	12	ACC:	12	Machine.Dec
    TICK:	164	PC:	64	ADDR:	4	MEM_OUT:	11	ACC:	12	Machine.Right
    TICK:	165	PC:	65	ADDR:	5	MEM_OUT:	4	ACC:	12	Machine.Right
    TICK:	166	PC:	66	ADDR:	6	MEM_OUT:	0	ACC:	12	Machine.Inc
    TICK:	168	PC:	67	ADDR:	6	MEM_OUT:	1	ACC:	0	Machine.Jz
    TICK:	170	PC:	68	ADDR:	6	MEM_OUT:	1	ACC:	1	Machine.Left
    TICK:	171	PC:	69	ADDR:	5	MEM_OUT:	4	ACC:	1	Machine.Jmp
    TICK:	172	PC:	67	ADDR:	5	MEM_OUT:	4	ACC:	1	Machine.Jz
    TICK:	174	PC:	68	ADDR:	5	MEM_OUT:	4	ACC:	4	Machine.Left
    TICK:	175	PC:	69	ADDR:	4	MEM_OUT:	11	ACC:	4	Machine.Jmp
    TICK:	176	PC:	67	ADDR:	4	MEM_OUT:	11	ACC:	4	Machine.Jz
    TICK:	178	PC:	68	ADDR:	4	MEM_OUT:	11	ACC:	11	Machine.Left
    TICK:	179	PC:	69	ADDR:	3	MEM_OUT:	13	ACC:	11	Machine.Jmp
    TICK:	180	PC:	67	ADDR:	3	MEM_OUT:	13	ACC:	11	Machine.Jz
    TICK:	182	PC:	68	ADDR:	3	MEM_OUT:	13	ACC:	13	Machine.Left
    TICK:	183	PC:	69	ADDR:	2	MEM_OUT:	9	ACC:	13	Machine.Jmp
    TICK:	184	PC:	67	ADDR:	2	MEM_OUT:	9	ACC:	13	Machine.Jz
    TICK:	186	PC:	68	ADDR:	2	MEM_OUT:	9	ACC:	9	Machine.Left
    TICK:	187	PC:	69	ADDR:	1	MEM_OUT:	0	ACC:	9	Machine.Jmp
    TICK:	188	PC:	67	ADDR:	1	MEM_OUT:	0	ACC:	9	Machine.Jz
    TICK:	190	PC:	70	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Left
    TICK:	191	PC:	71	ADDR:	0	MEM_OUT:	8	ACC:	0	Machine.Dec
    TICK:	193	PC:	72	ADDR:	0	MEM_OUT:	7	ACC:	8	Machine.Jmp
    TICK:	194	PC:	32	ADDR:	0	MEM_OUT:	7	ACC:	8	Machine.Jz
    TICK:	196	PC:	33	ADDR:	0	MEM_OUT:	7	ACC:	7	Machine.Right
    TICK:	197	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	7	Machine.Inc
    TICK:	199	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	201	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	203	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	205	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Machine.Jz
    TICK:	207	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Machine.Right
    TICK:	208	PC:	40	ADDR:	2	MEM_OUT:	9	ACC:	4	Machine.Inc
    TICK:	210	PC:	41	ADDR:	2	MEM_OUT:	10	ACC:	9	Machine.Inc
    TICK:	212	PC:	42	ADDR:	2	MEM_OUT:	11	ACC:	10	Machine.Right
    TICK:	213	PC:	43	ADDR:	3	MEM_OUT:	13	ACC:	10	Machine.Inc
    TICK:	215	PC:	44	ADDR:	3	MEM_OUT:	14	ACC:	13	Machine.Inc
    TICK:	217	PC:	45	ADDR:	3	MEM_OUT:	15	ACC:	14	Machine.Inc
    TICK:	219	PC:	46	ADDR:	3	MEM_OUT:	16	ACC:	15	Machine.Right
    TICK:	220	PC:	47	ADDR:	4	MEM_OUT:	11	ACC:	15	Machine.Inc
    TICK:	222	PC:	48	ADDR:	4	MEM_OUT:	12	ACC:	11	Machine.Inc
    TICK:	224	PC:	49	ADDR:	4	MEM_OUT:	13	ACC:	12	Machine.Inc
    TICK:	226	PC:	50	ADDR:	4	MEM_OUT:	14	ACC:	13	Machine.Right
    TICK:	227	PC:	51	ADDR:	5	MEM_OUT:	4	ACC:	13	Machine.Inc
    TICK:	229	PC:	52	ADDR:	5	MEM_OUT:	5	ACC:	4	Machine.Left
    TICK:	230	PC:	53	ADDR:	4	MEM_OUT:	14	ACC:	4	Machine.Left
    TICK:	231	PC:	54	ADDR:	3	MEM_OUT:	16	ACC:	4	Machine.Left
    TICK:	232	PC:	55	ADDR:	2	MEM_OUT:	11	ACC:	4	Machine.Left
    TICK:	233	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	4	Machine.Dec
    TICK:	235	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jmp
    TICK:	236	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jz
    TICK:	238	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Machine.Right
    TICK:	239	PC:	40	ADDR:	2	MEM_OUT:	11	ACC:	3	Machine.Inc
    TICK:	241	PC:	41	ADDR:	2	MEM_OUT:	12	ACC:	11	Machine.Inc
    TICK:	243	PC:	42	ADDR:	2	MEM_OUT:	13	ACC:	12	Machine.Right
    TICK:	244	PC:	43	ADDR:	3	MEM_OUT:	16	ACC:	12	Machine.Inc
    TICK:	246	PC:	44	ADDR:	3	MEM_OUT:	17	ACC:	16	Machine.Inc
    TICK:	248	PC:	45	ADDR:	3	MEM_OUT:	18	ACC:	17	Machine.Inc
    TICK:	250	PC:	46	ADDR:	3	MEM_OUT:	19	ACC:	18	Machine.Right
    TICK:	251	PC:	47	ADDR:	4	MEM_OUT:	14	ACC:	18	Machine.Inc
    TICK:	253	PC:	48	ADDR:	4	MEM_OUT:	15	ACC:	14	Machine.Inc
    TICK:	255	PC:	49	ADDR:	4	MEM_OUT:	16	ACC:	15	Machine.Inc
    TICK:	257	PC:	50	ADDR:	4	MEM_OUT:	17	ACC:	16	Machine.Right
    TICK:	258	PC:	51	ADDR:	5	MEM_OUT:	5	ACC:	16	Machine.Inc
    TICK:	260	PC:	52	ADDR:	5	MEM_OUT:	6	ACC:	5	Machine.Left
    TICK:	261	PC:	53	ADDR:	4	MEM_OUT:	17	ACC:	5	Machine.Left
    TICK:	262	PC:	54	ADDR:	3	MEM_OUT:	19	ACC:	5	Machine.Left
    TICK:	263	PC:	55	ADDR:	2	MEM_OUT:	13	ACC:	5	Machine.Left
    TICK:	264	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	5	Machine.Dec
    TICK:	266	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jmp
    TICK:	267	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jz
    TICK:	269	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Machine.Right
    TICK:	270	PC:	40	ADDR:	2	MEM_OUT:	13	ACC:	2	Machine.Inc
    TICK:	272	PC:	41	ADDR:	2	MEM_OUT:	14	ACC:	13	Machine.Inc
    TICK:	274	PC:	42	ADDR:	2	MEM_OUT:	15	ACC:	14	Machine.Right
    TICK:	275	PC:	43	ADDR:	3	MEM_OUT:	19	ACC:	14	Machine.Inc
    TICK:	277	PC:	44	ADDR:	3	MEM_OUT:	20	ACC:	19	Machine.Inc
    TICK:	279	PC:	45	ADDR:	3	MEM_OUT:	21	ACC:	20	Machine.Inc
    TICK:	281	PC:	46	ADDR:	3	MEM_OUT:	22	ACC:	21	Machine.Right
    TICK:	282	PC:	47	ADDR:	4	MEM_OUT:	17	ACC:	21	Machine.Inc
    TICK:	284	PC:	48	ADDR:	4	MEM_OUT:	18	ACC:	17	Machine.Inc
    TICK:	286	PC:	49	ADDR:	4	MEM_OUT:	19	ACC:	18	Machine.Inc
    TICK:	288	PC:	50	ADDR:	4	MEM_OUT:	20	ACC:	19	Machine.Right
    TICK:	289	PC:	51	ADDR:	5	MEM_OUT:	6	ACC:	19	Machine.Inc
    TICK:	291	PC:	52	ADDR:	5	MEM_OUT:	7	ACC:	6	Machine.Left
    TICK:	292	PC:	53	ADDR:	4	MEM_OUT:	20	ACC:	6	Machine.Left
    TICK:	293	PC:	54	ADDR:	3	MEM_OUT:	22	ACC:	6	Machine.Left
    TICK:	294	PC:	55	ADDR:	2	MEM_OUT:	15	ACC:	6	Machine.Left
    TICK:	295	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	6	Machine.Dec
    TICK:	297	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jmp
    TICK:	298	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jz
    TICK:	300	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Machine.Right
    TICK:	301	PC:	40	ADDR:	2	MEM_OUT:	15	ACC:	1	Machine.Inc
    TICK:	303	PC:	41	ADDR:	2	MEM_OUT:	16	ACC:	15	Machine.Inc
    TICK:	305	PC:	42	ADDR:	2	MEM_OUT:	17	ACC:	16	Machine.Right
    TICK:	306	PC:	43	ADDR:	3	MEM_OUT:	22	ACC:	16	Machine.Inc
    TICK:	308	PC:	44	ADDR:	3	MEM_OUT:	23	ACC:	22	Machine.Inc
    TICK:	310	PC:	45	ADDR:	3	MEM_OUT:	24	ACC:	23	Machine.Inc
    TICK:	312	PC:	46	ADDR:	3	MEM_OUT:	25	ACC:	24	Machine.Right
    TICK:	313	PC:	47	ADDR:	4	MEM_OUT:	20	ACC:	24	Machine.Inc
    TICK:	315	PC:	48	ADDR:	4	MEM_OUT:	21	ACC:	20	Machine.Inc
    TICK:	317	PC:	49	ADDR:	4	MEM_OUT:	22	ACC:	21	Machine.Inc
    TICK:	319	PC:	50	ADDR:	4	MEM_OUT:	23	ACC:	22	Machine.Right
    TICK:	320	PC:	51	ADDR:	5	MEM_OUT:	7	ACC:	22	Machine.Inc
    TICK:	322	PC:	52	ADDR:	5	MEM_OUT:	8	ACC:	7	Machine.Left
    TICK:	323	PC:	53	ADDR:	4	MEM_OUT:	23	ACC:	7	Machine.Left
    TICK:	324	PC:	54	ADDR:	3	MEM_OUT:	25	ACC:	7	Machine.Left
    TICK:	325	PC:	55	ADDR:	2	MEM_OUT:	17	ACC:	7	Machine.Left
    TICK:	326	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	7	Machine.Dec
    TICK:	328	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jmp
    TICK:	329	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jz
    TICK:	331	PC:	58	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	332	PC:	59	ADDR:	2	MEM_OUT:	17	ACC:	0	Machine.Inc
    TICK:	334	PC:	60	ADDR:	2	MEM_OUT:	18	ACC:	17	Machine.Right
    TICK:	335	PC:	61	ADDR:	3	MEM_OUT:	25	ACC:	17	Machine.Inc
    TICK:	337	PC:	62	ADDR:	3	MEM_OUT:	26	ACC:	25	Machine.Right
    TICK:	338	PC:	63	ADDR:	4	MEM_OUT:	23	ACC:	25	Machine.Dec
    TICK:	340	PC:	64	ADDR:	4	MEM_OUT:	22	ACC:	23	Machine.Right
    TICK:	341	PC:	65	ADDR:	5	MEM_OUT:	8	ACC:	23	Machine.Right
    TICK:	342	PC:	66	ADDR:	6	MEM_OUT:	1	ACC:	23	Machine.Inc
    TICK:	344	PC:	67	ADDR:	6	MEM_OUT:	2	ACC:	1	Machine.Jz
    TICK:	346	PC:	68	ADDR:	6	MEM_OUT:	2	ACC:	2	Machine.Left
    TICK:	347	PC:	69	ADDR:	5	MEM_OUT:	8	ACC:	2	Machine.Jmp
    TICK:	348	PC:	67	ADDR:	5	MEM_OUT:	8	ACC:	2	Machine.Jz
    TICK:	350	PC:	68	ADDR:	5	MEM_OUT:	8	ACC:	8	Machine.Left
    TICK:	351	PC:	69	ADDR:	4	MEM_OUT:	22	ACC:	8	Machine.Jmp
    TICK:	352	PC:	67	ADDR:	4	MEM_OUT:	22	ACC:	8	Machine.Jz
    TICK:	354	PC:	68	ADDR:	4	MEM_OUT:	22	ACC:	22	Machine.Left
    TICK:	355	PC:	69	ADDR:	3	MEM_OUT:	26	ACC:	22	Machine.Jmp
    TICK:	356	PC:	67	ADDR:	3	MEM_OUT:	26	ACC:	22	Machine.Jz
    TICK:	358	PC:	68	ADDR:	3	MEM_OUT:	26	ACC:	26	Machine.Left
    TICK:	359	PC:	69	ADDR:	2	MEM_OUT:	18	ACC:	26	Machine.Jmp
    TICK:	360	PC:	67	ADDR:	2	MEM_OUT:	18	ACC:	26	Machine.Jz
    TICK:	362	PC:	68	ADDR:	2	MEM_OUT:	18	ACC:	18	Machine.Left
    TICK:	363	PC:	69	ADDR:	1	MEM_OUT:	0	ACC:	18	Machine.Jmp
    TICK:	364	PC:	67	ADDR:	1	MEM_OUT:	0	ACC:	18	Machine.Jz
    TICK:	366	PC:	70	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Left
    TICK:	367	PC:	71	ADDR:	0	MEM_OUT:	7	ACC:	0	Machine.Dec
    TICK:	369	PC:	72	ADDR:	0	MEM_OUT:	6	ACC:	7	Machine.Jmp
    TICK:	370	PC:	32	ADDR:	0	MEM_OUT:	6	ACC:	7	Machine.Jz
    TICK:	372	PC:	33	ADDR:	0	MEM_OUT:	6	ACC:	6	Machine.Right
    TICK:	373	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	6	Machine.Inc
    TICK:	375	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	377	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	379	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	381	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Machine.Jz
    TICK:	383	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Machine.Right
    TICK:	384	PC:	40	ADDR:	2	MEM_OUT:	18	ACC:	4	Machine.Inc
    TICK:	386	PC:	41	ADDR:	2	MEM_OUT:	19	ACC:	18	Machine.Inc
    TICK:	388	PC:	42	ADDR:	2	MEM_OUT:	20	ACC:	19	Machine.Right
    TICK:	389	PC:	43	ADDR:	3	MEM_OUT:	26	ACC:	19	Machine.Inc
    TICK:	391	PC:	44	ADDR:	3	MEM_OUT:	27	ACC:	26	Machine.Inc
    TICK:	393	PC:	45	ADDR:	3	MEM_OUT:	28	ACC:	27	Machine.Inc
    TICK:	395	PC:	46	ADDR:	3	MEM_OUT:	29	ACC:	28	Machine.Right
    TICK:	396	PC:	47	ADDR:	4	MEM_OUT:	22	ACC:	28	Machine.Inc
    TICK:	398	PC:	48	ADDR:	4	MEM_OUT:	23	ACC:	22	Machine.Inc
    TICK:	400	PC:	49	ADDR:	4	MEM_OUT:	24	ACC:	23	Machine.Inc
    TICK:	402	PC:	50	ADDR:	4	MEM_OUT:	25	ACC:	24	Machine.Right
    TICK:	403	PC:	51	ADDR:	5	MEM_OUT:	8	ACC:	24	Machine.Inc
    TICK:	405	PC:	52	ADDR:	5	MEM_OUT:	9	ACC:	8	Machine.Left
    TICK:	406	PC:	53	ADDR:	4	MEM_OUT:	25	ACC:	8	Machine.Left
    TICK:	407	PC:	54	ADDR:	3	MEM_OUT:	29	ACC:	8	Machine.Left
    TICK:	408	PC:	55	ADDR:	2	MEM_OUT:	20	ACC:	8	Machine.Left
    TICK:	409	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	8	Machine.Dec
    TICK:	411	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jmp
    TICK:	412	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jz
    TICK:	414	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Machine.Right
    TICK:	415	PC:	40	ADDR:	2	MEM_OUT:	20	ACC:	3	Machine.Inc
    TICK:	417	PC:	41	ADDR:	2	MEM_OUT:	21	ACC:	20	Machine.Inc
    TICK:	419	PC:	42	ADDR:	2	MEM_OUT:	22	ACC:	21	Machine.Right
    TICK:	420	PC:	43	ADDR:	3	MEM_OUT:	29	ACC:	21	Machine.Inc
    TICK:	422	PC:	44	ADDR:	3	MEM_OUT:	30	ACC:	29	Machine.Inc
    TICK:	424	PC:	45	ADDR:	3	MEM_OUT:	31	ACC:	30	Machine.Inc
    TICK:	426	PC:	46	ADDR:	3	MEM_OUT:	32	ACC:	31	Machine.Right
    TICK:	427	PC:	47	ADDR:	4	MEM_OUT:	25	ACC:	31	Machine.Inc
    TICK:	429	PC:	48	ADDR:	4	MEM_OUT:	26	ACC:	25	Machine.Inc
    TICK:	431	PC:	49	ADDR:	4	MEM_OUT:	27	ACC:	26	Machine.Inc
    TICK:	433	PC:	50	ADDR:	4	MEM_OUT:	28	ACC:	27	Machine.Right
    TICK:	434	PC:	51	ADDR:	5	MEM_OUT:	9	ACC:	27	Machine.Inc
    TICK:	436	PC:	52	ADDR:	5	MEM_OUT:	10	ACC:	9	Machine.Left
    TICK:	437	PC:	53	ADDR:	4	MEM_OUT:	28	ACC:	9	Machine.Left
    TICK:	438	PC:	54	ADDR:	3	MEM_OUT:	32	ACC:	9	Machine.Left
    TICK:	439	PC:	55	ADDR:	2	MEM_OUT:	22	ACC:	9	Machine.Left
    TICK:	440	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	9	Machine.Dec
    TICK:	442	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jmp
    TICK:	443	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jz
    TICK:	445	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Machine.Right
    TICK:	446	PC:	40	ADDR:	2	MEM_OUT:	22	ACC:	2	Machine.Inc
    TICK:	448	PC:	41	ADDR:	2	MEM_OUT:	23	ACC:	22	Machine.Inc
    TICK:	450	PC:	42	ADDR:	2	MEM_OUT:	24	ACC:	23	Machine.Right
    TICK:	451	PC:	43	ADDR:	3	MEM_OUT:	32	ACC:	23	Machine.Inc
    TICK:	453	PC:	44	ADDR:	3	MEM_OUT:	33	ACC:	32	Machine.Inc
    TICK:	455	PC:	45	ADDR:	3	MEM_OUT:	34	ACC:	33	Machine.Inc
    TICK:	457	PC:	46	ADDR:	3	MEM_OUT:	35	ACC:	34	Machine.Right
    TICK:	458	PC:	47	ADDR:	4	MEM_OUT:	28	ACC:	34	Machine.Inc
    TICK:	460	PC:	48	ADDR:	4	MEM_OUT:	29	ACC:	28	Machine.Inc
    TICK:	462	PC:	49	ADDR:	4	MEM_OUT:	30	ACC:	29	Machine.Inc
    TICK:	464	PC:	50	ADDR:	4	MEM_OUT:	31	ACC:	30	Machine.Right
    TICK:	465	PC:	51	ADDR:	5	MEM_OUT:	10	ACC:	30	Machine.Inc
    TICK:	467	PC:	52	ADDR:	5	MEM_OUT:	11	ACC:	10	Machine.Left
    TICK:	468	PC:	53	ADDR:	4	MEM_OUT:	31	ACC:	10	Machine.Left
    TICK:	469	PC:	54	ADDR:	3	MEM_OUT:	35	ACC:	10	Machine.Left
    TICK:	470	PC:	55	ADDR:	2	MEM_OUT:	24	ACC:	10	Machine.Left
    TICK:	471	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	10	Machine.Dec
    TICK:	473	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jmp
    TICK:	474	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jz
    TICK:	476	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Machine.Right
    TICK:	477	PC:	40	ADDR:	2	MEM_OUT:	24	ACC:	1	Machine.Inc
    TICK:	479	PC:	41	ADDR:	2	MEM_OUT:	25	ACC:	24	Machine.Inc
    TICK:	481	PC:	42	ADDR:	2	MEM_OUT:	26	ACC:	25	Machine.Right
    TICK:	482	PC:	43	ADDR:	3	MEM_OUT:	35	ACC:	25	Machine.Inc
    TICK:	484	PC:	44	ADDR:	3	MEM_OUT:	36	ACC:	35	Machine.Inc
    TICK:	486	PC:	45	ADDR:	3	MEM_OUT:	37	ACC:	36	Machine.Inc
    TICK:	488	PC:	46	ADDR:	3	MEM_OUT:	38	ACC:	37	Machine.Right
    TICK:	489	PC:	47	ADDR:	4	MEM_OUT:	31	ACC:	37	Machine.Inc
    TICK:	491	PC:	48	ADDR:	4	MEM_OUT:	32	ACC:	31	Machine.Inc
    TICK:	493	PC:	49	ADDR:	4	MEM_OUT:	33	ACC:	32	Machine.Inc
    TICK:	495	PC:	50	ADDR:	4	MEM_OUT:	34	ACC:	33	Machine.Right
    TICK:	496	PC:	51	ADDR:	5	MEM_OUT:	11	ACC:	33	Machine.Inc
    TICK:	498	PC:	52	ADDR:	5	MEM_OUT:	12	ACC:	11	Machine.Left
    TICK:	499	PC:	53	ADDR:	4	MEM_OUT:	34	ACC:	11	Machine.Left
    TICK:	500	PC:	54	ADDR:	3	MEM_OUT:	38	ACC:	11	Machine.Left
    TICK:	501	PC:	55	ADDR:	2	MEM_OUT:	26	ACC:	11	Machine.Left
    TICK:	502	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	11	Machine.Dec
    TICK:	504	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jmp
    TICK:	505	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jz
    TICK:	507	PC:	58	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	508	PC:	59	ADDR:	2	MEM_OUT:	26	ACC:	0	Machine.Inc
    TICK:	510	PC:	60	ADDR:	2	MEM_OUT:	27	ACC:	26	Machine.Right
    TICK:	511	PC:	61	ADDR:	3	MEM_OUT:	38	ACC:	26	Machine.Inc
    TICK:	513	PC:	62	ADDR:	3	MEM_OUT:	39	ACC:	38	Machine.Right
    TICK:	514	PC:	63	ADDR:	4	MEM_OUT:	34	ACC:	38	Machine.Dec
    TICK:	516	PC:	64	ADDR:	4	MEM_OUT:	33	ACC:	34	Machine.Right
    TICK:	517	PC:	65	ADDR:	5	MEM_OUT:	12	ACC:	34	Machine.Right
    TICK:	518	PC:	66	ADDR:	6	MEM_OUT:	2	ACC:	34	Machine.Inc
    TICK:	520	PC:	67	ADDR:	6	MEM_OUT:	3	ACC:	2	Machine.Jz
    TICK:	522	PC:	68	ADDR:	6	MEM_OUT:	3	ACC:	3	Machine.Left
    TICK:	523	PC:	69	ADDR:	5	MEM_OUT:	12	ACC:	3	Machine.Jmp
    TICK:	524	PC:	67	ADDR:	5	MEM_OUT:	12	ACC:	3	Machine.Jz
    TICK:	526	PC:	68	ADDR:	5	MEM_OUT:	12	ACC:	12	Machine.Left
    TICK:	527	PC:	69	ADDR:	4	MEM_OUT:	33	ACC:	12	Machine.Jmp
    TICK:	528	PC:	67	ADDR:	4	MEM_OUT:	33	ACC:	12	Machine.Jz
    TICK:	530	PC:	68	ADDR:	4	MEM_OUT:	33	ACC:	33	Machine.Left
    TICK:	531	PC:	69	ADDR:	3	MEM_OUT:	39	ACC:	33	Machine.Jmp
    TICK:	532	PC:	67	ADDR:	3	MEM_OUT:	39	ACC:	33	Machine.Jz
    TICK:	534	PC:	68	ADDR:	3	MEM_OUT:	39	ACC:	39	Machine.Left
    TICK:	535	PC:	69	ADDR:	2	MEM_OUT:	27	ACC:	39	Machine.Jmp
    TICK:	536	PC:	67	ADDR:	2	MEM_OUT:	27	ACC:	39	Machine.Jz
    TICK:	538	PC:	68	ADDR:	2	MEM_OUT:	27	ACC:	27	Machine.Left
    TICK:	539	PC:	69	ADDR:	1	MEM_OUT:	0	ACC:	27	Machine.Jmp
    TICK:	540	PC:	67	ADDR:	1	MEM_OUT:	0	ACC:	27	Machine.Jz
    TICK:	542	PC:	70	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Left
    TICK:	543	PC:	71	ADDR:	0	MEM_OUT:	6	ACC:	0	Machine.Dec
    TICK:	545	PC:	72	ADDR:	0	MEM_OUT:	5	ACC:	6	Machine.Jmp
    TICK:	546	PC:	32	ADDR:	0	MEM_OUT:	5	ACC:	6	Machine.Jz
    TICK:	548	PC:	33	ADDR:	0	MEM_OUT:	5	ACC:	5	Machine.Right
    TICK:	549	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	5	Machine.Inc
    TICK:	551	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	553	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	555	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	557	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Machine.Jz
    TICK:	559	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Machine.Right
    TICK:	560	PC:	40	ADDR:	2	MEM_OUT:	27	ACC:	4	Machine.Inc
    TICK:	562	PC:	41	ADDR:	2	MEM_OUT:	28	ACC:	27	Machine.Inc
    TICK:	564	PC:	42	ADDR:	2	MEM_OUT:	29	ACC:	28	Machine.Right
    TICK:	565	PC:	43	ADDR:	3	MEM_OUT:	39	ACC:	28	Machine.Inc
    TICK:	567	PC:	44	ADDR:	3	MEM_OUT:	40	ACC:	39	Machine.Inc
    TICK:	569	PC:	45	ADDR:	3	MEM_OUT:	41	ACC:	40	Machine.Inc
    TICK:	571	PC:	46	ADDR:	3	MEM_OUT:	42	ACC:	41	Machine.Right
    TICK:	572	PC:	47	ADDR:	4	MEM_OUT:	33	ACC:	41	Machine.Inc
    TICK:	574	PC:	48	ADDR:	4	MEM_OUT:	34	ACC:	33	Machine.Inc
    TICK:	576	PC:	49	ADDR:	4	MEM_OUT:	35	ACC:	34	Machine.Inc
    TICK:	578	PC:	50	ADDR:	4	MEM_OUT:	36	ACC:	35	Machine.Right
    TICK:	579	PC:	51	ADDR:	5	MEM_OUT:	12	ACC:	35	Machine.Inc
    TICK:	581	PC:	52	ADDR:	5	MEM_OUT:	13	ACC:	12	Machine.Left
    TICK:	582	PC:	53	ADDR:	4	MEM_OUT:	36	ACC:	12	Machine.Left
    TICK:	583	PC:	54	ADDR:	3	MEM_OUT:	42	ACC:	12	Machine.Left
    TICK:	584	PC:	55	ADDR:	2	MEM_OUT:	29	ACC:	12	Machine.Left
    TICK:	585	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	12	Machine.Dec
    TICK:	587	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jmp
    TICK:	588	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jz
    TICK:	590	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Machine.Right
    TICK:	591	PC:	40	ADDR:	2	MEM_OUT:	29	ACC:	3	Machine.Inc
    TICK:	593	PC:	41	ADDR:	2	MEM_OUT:	30	ACC:	29	Machine.Inc
    TICK:	595	PC:	42	ADDR:	2	MEM_OUT:	31	ACC:	30	Machine.Right
    TICK:	596	PC:	43	ADDR:	3	MEM_OUT:	42	ACC:	30	Machine.Inc
    TICK:	598	PC:	44	ADDR:	3	MEM_OUT:	43	ACC:	42	Machine.Inc
    TICK:	600	PC:	45	ADDR:	3	MEM_OUT:	44	ACC:	43	Machine.Inc
    TICK:	602	PC:	46	ADDR:	3	MEM_OUT:	45	ACC:	44	Machine.Right
    TICK:	603	PC:	47	ADDR:	4	MEM_OUT:	36	ACC:	44	Machine.Inc
    TICK:	605	PC:	48	ADDR:	4	MEM_OUT:	37	ACC:	36	Machine.Inc
    TICK:	607	PC:	49	ADDR:	4	MEM_OUT:	38	ACC:	37	Machine.Inc
    TICK:	609	PC:	50	ADDR:	4	MEM_OUT:	39	ACC:	38	Machine.Right
    TICK:	610	PC:	51	ADDR:	5	MEM_OUT:	13	ACC:	38	Machine.Inc
    TICK:	612	PC:	52	ADDR:	5	MEM_OUT:	14	ACC:	13	Machine.Left
    TICK:	613	PC:	53	ADDR:	4	MEM_OUT:	39	ACC:	13	Machine.Left
    TICK:	614	PC:	54	ADDR:	3	MEM_OUT:	45	ACC:	13	Machine.Left
    TICK:	615	PC:	55	ADDR:	2	MEM_OUT:	31	ACC:	13	Machine.Left
    TICK:	616	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	13	Machine.Dec
    TICK:	618	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jmp
    TICK:	619	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jz
    TICK:	621	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Machine.Right
    TICK:	622	PC:	40	ADDR:	2	MEM_OUT:	31	ACC:	2	Machine.Inc
    TICK:	624	PC:	41	ADDR:	2	MEM_OUT:	32	ACC:	31	Machine.Inc
    TICK:	626	PC:	42	ADDR:	2	MEM_OUT:	33	ACC:	32	Machine.Right
    TICK:	627	PC:	43	ADDR:	3	MEM_OUT:	45	ACC:	32	Machine.Inc
    TICK:	629	PC:	44	ADDR:	3	MEM_OUT:	46	ACC:	45	Machine.Inc
    TICK:	631	PC:	45	ADDR:	3	MEM_OUT:	47	ACC:	46	Machine.Inc
    TICK:	633	PC:	46	ADDR:	3	MEM_OUT:	48	ACC:	47	Machine.Right
    TICK:	634	PC:	47	ADDR:	4	MEM_OUT:	39	ACC:	47	Machine.Inc
    TICK:	636	PC:	48	ADDR:	4	MEM_OUT:	40	ACC:	39	Machine.Inc
    TICK:	638	PC:	49	ADDR:	4	MEM_OUT:	41	ACC:	40	Machine.Inc
    TICK:	640	PC:	50	ADDR:	4	MEM_OUT:	42	ACC:	41	Machine.Right
    TICK:	641	PC:	51	ADDR:	5	MEM_OUT:	14	ACC:	41	Machine.Inc
    TICK:	643	PC:	52	ADDR:	5	MEM_OUT:	15	ACC:	14	Machine.Left
    TICK:	644	PC:	53	ADDR:	4	MEM_OUT:	42	ACC:	14	Machine.Left
    TICK:	645	PC:	54	ADDR:	3	MEM_OUT:	48	ACC:	14	Machine.Left
    TICK:	646	PC:	55	ADDR:	2	MEM_OUT:	33	ACC:	14	Machine.Left
    TICK:	647	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	14	Machine.Dec
    TICK:	649	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jmp
    TICK:	650	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jz
    TICK:	652	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Machine.Right
    TICK:	653	PC:	40	ADDR:	2	MEM_OUT:	33	ACC:	1	Machine.Inc
    TICK:	655	PC:	41	ADDR:	2	MEM_OUT:	34	ACC:	33	Machine.Inc
    TICK:	657	PC:	42	ADDR:	2	MEM_OUT:	35	ACC:	34	Machine.Right
    TICK:	658	PC:	43	ADDR:	3	MEM_OUT:	48	ACC:	34	Machine.Inc
    TICK:	660	PC:	44	ADDR:	3	MEM_OUT:	49	ACC:	48	Machine.Inc
    TICK:	662	PC:	45	ADDR:	3	MEM_OUT:	50	ACC:	49	Machine.Inc
    TICK:	664	PC:	46	ADDR:	3	MEM_OUT:	51	ACC:	50	Machine.Right
    TICK:	665	PC:	47	ADDR:	4	MEM_OUT:	42	ACC:	50	Machine.Inc
    TICK:	667	PC:	48	ADDR:	4	MEM_OUT:	43	ACC:	42	Machine.Inc
    TICK:	669	PC:	49	ADDR:	4	MEM_OUT:	44	ACC:	43	Machine.Inc
    TICK:	671	PC:	50	ADDR:	4	MEM_OUT:	45	ACC:	44	Machine.Right
    TICK:	672	PC:	51	ADDR:	5	MEM_OUT:	15	ACC:	44	Machine.Inc
    TICK:	674	PC:	52	ADDR:	5	MEM_OUT:	16	ACC:	15	Machine.Left
    TICK:	675	PC:	53	ADDR:	4	MEM_OUT:	45	ACC:	15	Machine.Left
    TICK:	676	PC:	54	ADDR:	3	MEM_OUT:	51	ACC:	15	Machine.Left
    TICK:	677	PC:	55	ADDR:	2	MEM_OUT:	35	ACC:	15	Machine.Left
    TICK:	678	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	15	Machine.Dec
    TICK:	680	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jmp
    TICK:	681	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jz
    TICK:	683	PC:	58	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	684	PC:	59	ADDR:	2	MEM_OUT:	35	ACC:	0	Machine.Inc
    TICK:	686	PC:	60	ADDR:	2	MEM_OUT:	36	ACC:	35	Machine.Right
    TICK:	687	PC:	61	ADDR:	3	MEM_OUT:	51	ACC:	35	Machine.Inc
    TICK:	689	PC:	62	ADDR:	3	MEM_OUT:	52	ACC:	51	Machine.Right
    TICK:	690	PC:	63	ADDR:	4	MEM_OUT:	45	ACC:	51	Machine.Dec
    TICK:	692	PC:	64	ADDR:	4	MEM_OUT:	44	ACC:	45	Machine.Right
    TICK:	693	PC:	65	ADDR:	5	MEM_OUT:	16	ACC:	45	Machine.Right
    TICK:	694	PC:	66	ADDR:	6	MEM_OUT:	3	ACC:	45	Machine.Inc
    TICK:	696	PC:	67	ADDR:	6	MEM_OUT:	4	ACC:	3	Machine.Jz
    TICK:	698	PC:	68	ADDR:	6	MEM_OUT:	4	ACC:	4	Machine.Left
    TICK:	699	PC:	69	ADDR:	5	MEM_OUT:	16	ACC:	4	Machine.Jmp
    TICK:	700	PC:	67	ADDR:	5	MEM_OUT:	16	ACC:	4	Machine.Jz
    TICK:	702	PC:	68	ADDR:	5	MEM_OUT:	16	ACC:	16	Machine.Left
    TICK:	703	PC:	69	ADDR:	4	MEM_OUT:	44	ACC:	16	Machine.Jmp
    TICK:	704	PC:	67	ADDR:	4	MEM_OUT:	44	ACC:	16	Machine.Jz
    TICK:	706	PC:	68	ADDR:	4	MEM_OUT:	44	ACC:	44	Machine.Left
    TICK:	707	PC:	69	ADDR:	3	MEM_OUT:	52	ACC:	44	Machine.Jmp
    TICK:	708	PC:	67	ADDR:	3	MEM_OUT:	52	ACC:	44	Machine.Jz
    TICK:	710	PC:	68	ADDR:	3	MEM_OUT:	52	ACC:	52	Machine.Left
    TICK:	711	PC:	69	ADDR:	2	MEM_OUT:	36	ACC:	52	Machine.Jmp
    TICK:	712	PC:	67	ADDR:	2	MEM_OUT:	36	ACC:	52	Machine.Jz
    TICK:	714	PC:	68	ADDR:	2	MEM_OUT:	36	ACC:	36	Machine.Left
    TICK:	715	PC:	69	ADDR:	1	MEM_OUT:	0	ACC:	36	Machine.Jmp
    TICK:	716	PC:	67	ADDR:	1	MEM_OUT:	0	ACC:	36	Machine.Jz
    TICK:	718	PC:	70	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Left
    TICK:	719	PC:	71	ADDR:	0	MEM_OUT:	5	ACC:	0	Machine.Dec
    TICK:	721	PC:	72	ADDR:	0	MEM_OUT:	4	ACC:	5	Machine.Jmp
    TICK:	722	PC:	32	ADDR:	0	MEM_OUT:	4	ACC:	5	Machine.Jz
    TICK:	724	PC:	33	ADDR:	0	MEM_OUT:	4	ACC:	4	Machine.Right
    TICK:	725	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	4	Machine.Inc
    TICK:	727	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	729	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	731	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	733	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Machine.Jz
    TICK:	735	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Machine.Right
    TICK:	736	PC:	40	ADDR:	2	MEM_OUT:	36	ACC:	4	Machine.Inc
    TICK:	738	PC:	41	ADDR:	2	MEM_OUT:	37	ACC:	36	Machine.Inc
    TICK:	740	PC:	42	ADDR:	2	MEM_OUT:	38	ACC:	37	Machine.Right
    TICK:	741	PC:	43	ADDR:	3	MEM_OUT:	52	ACC:	37	Machine.Inc
    TICK:	743	PC:	44	ADDR:	3	MEM_OUT:	53	ACC:	52	Machine.Inc
    TICK:	745	PC:	45	ADDR:	3	MEM_OUT:	54	ACC:	53	Machine.Inc
    TICK:	747	PC:	46	ADDR:	3	MEM_OUT:	55	ACC:	54	Machine.Right
    TICK:	748	PC:	47	ADDR:	4	MEM_OUT:	44	ACC:	54	Machine.Inc
    TICK:	750	PC:	48	ADDR:	4	MEM_OUT:	45	ACC:	44	Machine.Inc
    TICK:	752	PC:	49	ADDR:	4	MEM_OUT:	46	ACC:	45	Machine.Inc
    TICK:	754	PC:	50	ADDR:	4	MEM_OUT:	47	ACC:	46	Machine.Right
    TICK:	755	PC:	51	ADDR:	5	MEM_OUT:	16	ACC:	46	Machine.Inc
    TICK:	757	PC:	52	ADDR:	5	MEM_OUT:	17	ACC:	16	Machine.Left
    TICK:	758	PC:	53	ADDR:	4	MEM_OUT:	47	ACC:	16	Machine.Left
    TICK:	759	PC:	54	ADDR:	3	MEM_OUT:	55	ACC:	16	Machine.Left
    TICK:	760	PC:	55	ADDR:	2	MEM_OUT:	38	ACC:	16	Machine.Left
    TICK:	761	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	16	Machine.Dec
    TICK:	763	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jmp
    TICK:	764	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jz
    TICK:	766	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Machine.Right
    TICK:	767	PC:	40	ADDR:	2	MEM_OUT:	38	ACC:	3	Machine.Inc
    TICK:	769	PC:	41	ADDR:	2	MEM_OUT:	39	ACC:	38	Machine.Inc
    TICK:	771	PC:	42	ADDR:	2	MEM_OUT:	40	ACC:	39	Machine.Right
    TICK:	772	PC:	43	ADDR:	3	MEM_OUT:	55	ACC:	39	Machine.Inc
    TICK:	774	PC:	44	ADDR:	3	MEM_OUT:	56	ACC:	55	Machine.Inc
    TICK:	776	PC:	45	ADDR:	3	MEM_OUT:	57	ACC:	56	Machine.Inc
    TICK:	778	PC:	46	ADDR:	3	MEM_OUT:	58	ACC:	57	Machine.Right
    TICK:	779	PC:	47	ADDR:	4	MEM_OUT:	47	ACC:	57	Machine.Inc
    TICK:	781	PC:	48	ADDR:	4	MEM_OUT:	48	ACC:	47	Machine.Inc
    TICK:	783	PC:	49	ADDR:	4	MEM_OUT:	49	ACC:	48	Machine.Inc
    TICK:	785	PC:	50	ADDR:	4	MEM_OUT:	50	ACC:	49	Machine.Right
    TICK:	786	PC:	51	ADDR:	5	MEM_OUT:	17	ACC:	49	Machine.Inc
    TICK:	788	PC:	52	ADDR:	5	MEM_OUT:	18	ACC:	17	Machine.Left
    TICK:	789	PC:	53	ADDR:	4	MEM_OUT:	50	ACC:	17	Machine.Left
    TICK:	790	PC:	54	ADDR:	3	MEM_OUT:	58	ACC:	17	Machine.Left
    TICK:	791	PC:	55	ADDR:	2	MEM_OUT:	40	ACC:	17	Machine.Left
    TICK:	792	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	17	Machine.Dec
    TICK:	794	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jmp
    TICK:	795	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jz
    TICK:	797	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Machine.Right
    TICK:	798	PC:	40	ADDR:	2	MEM_OUT:	40	ACC:	2	Machine.Inc
    TICK:	800	PC:	41	ADDR:	2	MEM_OUT:	41	ACC:	40	Machine.Inc
    TICK:	802	PC:	42	ADDR:	2	MEM_OUT:	42	ACC:	41	Machine.Right
    TICK:	803	PC:	43	ADDR:	3	MEM_OUT:	58	ACC:	41	Machine.Inc
    TICK:	805	PC:	44	ADDR:	3	MEM_OUT:	59	ACC:	58	Machine.Inc
    TICK:	807	PC:	45	ADDR:	3	MEM_OUT:	60	ACC:	59	Machine.Inc
    TICK:	809	PC:	46	ADDR:	3	MEM_OUT:	61	ACC:	60	Machine.Right
    TICK:	810	PC:	47	ADDR:	4	MEM_OUT:	50	ACC:	60	Machine.Inc
    TICK:	812	PC:	48	ADDR:	4	MEM_OUT:	51	ACC:	50	Machine.Inc
    TICK:	814	PC:	49	ADDR:	4	MEM_OUT:	52	ACC:	51	Machine.Inc
    TICK:	816	PC:	50	ADDR:	4	MEM_OUT:	53	ACC:	52	Machine.Right
    TICK:	817	PC:	51	ADDR:	5	MEM_OUT:	18	ACC:	52	Machine.Inc
    TICK:	819	PC:	52	ADDR:	5	MEM_OUT:	19	ACC:	18	Machine.Left
    TICK:	820	PC:	53	ADDR:	4	MEM_OUT:	53	ACC:	18	Machine.Left
    TICK:	821	PC:	54	ADDR:	3	MEM_OUT:	61	ACC:	18	Machine.Left
    TICK:	822	PC:	55	ADDR:	2	MEM_OUT:	42	ACC:	18	Machine.Left
    TICK:	823	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	18	Machine.Dec
    TICK:	825	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jmp
    TICK:	826	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jz
    TICK:	828	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Machine.Right
    TICK:	829	PC:	40	ADDR:	2	MEM_OUT:	42	ACC:	1	Machine.Inc
    TICK:	831	PC:	41	ADDR:	2	MEM_OUT:	43	ACC:	42	Machine.Inc
    TICK:	833	PC:	42	ADDR:	2	MEM_OUT:	44	ACC:	43	Machine.Right
    TICK:	834	PC:	43	ADDR:	3	MEM_OUT:	61	ACC:	43	Machine.Inc
    TICK:	836	PC:	44	ADDR:	3	MEM_OUT:	62	ACC:	61	Machine.Inc
    TICK:	838	PC:	45	ADDR:	3	MEM_OUT:	63	ACC:	62	Machine.Inc
    TICK:	840	PC:	46	ADDR:	3	MEM_OUT:	64	ACC:	63	Machine.Right
    TICK:	841	PC:	47	ADDR:	4	MEM_OUT:	53	ACC:	63	Machine.Inc
    TICK:	843	PC:	48	ADDR:	4	MEM_OUT:	54	ACC:	53	Machine.Inc
    TICK:	845	PC:	49	ADDR:	4	MEM_OUT:	55	ACC:	54	Machine.Inc
    TICK:	847	PC:	50	ADDR:	4	MEM_OUT:	56	ACC:	55	Machine.Right
    TICK:	848	PC:	51	ADDR:	5	MEM_OUT:	19	ACC:	55	Machine.Inc
    TICK:	850	PC:	52	ADDR:	5	MEM_OUT:	20	ACC:	19	Machine.Left
    TICK:	851	PC:	53	ADDR:	4	MEM_OUT:	56	ACC:	19	Machine.Left
    TICK:	852	PC:	54	ADDR:	3	MEM_OUT:	64	ACC:	19	Machine.Left
    TICK:	853	PC:	55	ADDR:	2	MEM_OUT:	44	ACC:	19	Machine.Left
    TICK:	854	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	19	Machine.Dec
    TICK:	856	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jmp
    TICK:	857	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jz
    TICK:	859	PC:	58	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	860	PC:	59	ADDR:	2	MEM_OUT:	44	ACC:	0	Machine.Inc
    TICK:	862	PC:	60	ADDR:	2	MEM_OUT:	45	ACC:	44	Machine.Right
    TICK:	863	PC:	61	ADDR:	3	MEM_OUT:	64	ACC:	44	Machine.Inc
    TICK:	865	PC:	62	ADDR:	3	MEM_OUT:	65	ACC:	64	Machine.Right
    TICK:	866	PC:	63	ADDR:	4	MEM_OUT:	56	ACC:	64	Machine.Dec
    TICK:	868	PC:	64	ADDR:	4	MEM_OUT:	55	ACC:	56	Machine.Right
    TICK:	869	PC:	65	ADDR:	5	MEM_OUT:	20	ACC:	56	Machine.Right
    TICK:	870	PC:	66	ADDR:	6	MEM_OUT:	4	ACC:	56	Machine.Inc
    TICK:	872	PC:	67	ADDR:	6	MEM_OUT:	5	ACC:	4	Machine.Jz
    TICK:	874	PC:	68	ADDR:	6	MEM_OUT:	5	ACC:	5	Machine.Left
    TICK:	875	PC:	69	ADDR:	5	MEM_OUT:	20	ACC:	5	Machine.Jmp
    TICK:	876	PC:	67	ADDR:	5	MEM_OUT:	20	ACC:	5	Machine.Jz
    TICK:	878	PC:	68	ADDR:	5	MEM_OUT:	20	ACC:	20	Machine.Left
    TICK:	879	PC:	69	ADDR:	4	MEM_OUT:	55	ACC:	20	Machine.Jmp
    TICK:	880	PC:	67	ADDR:	4	MEM_OUT:	55	ACC:	20	Machine.Jz
    TICK:	882	PC:	68	ADDR:	4	MEM_OUT:	55	ACC:	55	Machine.Left
    TICK:	883	PC:	69	ADDR:	3	MEM_OUT:	65	ACC:	55	Machine.Jmp
    TICK:	884	PC:	67	ADDR:	3	MEM_OUT:	65	ACC:	55	Machine.Jz
    TICK:	886	PC:	68	ADDR:	3	MEM_OUT:	65	ACC:	65	Machine.Left
    TICK:	887	PC:	69	ADDR:	2	MEM_OUT:	45	ACC:	65	Machine.Jmp
    TICK:	888	PC:	67	ADDR:	2	MEM_OUT:	45	ACC:	65	Machine.Jz
    TICK:	890	PC:	68	ADDR:	2	MEM_OUT:	45	ACC:	45	Machine.Left
    TICK:	891	PC:	69	ADDR:	1	MEM_OUT:	0	ACC:	45	Machine.Jmp
    TICK:	892	PC:	67	ADDR:	1	MEM_OUT:	0	ACC:	45	Machine.Jz
    TICK:	894	PC:	70	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Left
    TICK:	895	PC:	71	ADDR:	0	MEM_OUT:	4	ACC:	0	Machine.Dec
    TICK:	897	PC:	72	ADDR:	0	MEM_OUT:	3	ACC:	4	Machine.Jmp
    TICK:	898	PC:	32	ADDR:	0	MEM_OUT:	3	ACC:	4	Machine.Jz
    TICK:	900	PC:	33	ADDR:	0	MEM_OUT:	3	ACC:	3	Machine.Right
    TICK:	901	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	3	Machine.Inc
    TICK:	903	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	905	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	907	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	909	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Machine.Jz
    TICK:	911	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Machine.Right
    TICK:	912	PC:	40	ADDR:	2	MEM_OUT:	45	ACC:	4	Machine.Inc
    TICK:	914	PC:	41	ADDR:	2	MEM_OUT:	46	ACC:	45	Machine.Inc
    TICK:	916	PC:	42	ADDR:	2	MEM_OUT:	47	ACC:	46	Machine.Right
    TICK:	917	PC:	43	ADDR:	3	MEM_OUT:	65	ACC:	46	Machine.Inc
    TICK:	919	PC:	44	ADDR:	3	MEM_OUT:	66	ACC:	65	Machine.Inc
    TICK:	921	PC:	45	ADDR:	3	MEM_OUT:	67	ACC:	66	Machine.Inc
    TICK:	923	PC:	46	ADDR:	3	MEM_OUT:	68	ACC:	67	Machine.Right
    TICK:	924	PC:	47	ADDR:	4	MEM_OUT:	55	ACC:	67	Machine.Inc
    TICK:	926	PC:	48	ADDR:	4	MEM_OUT:	56	ACC:	55	Machine.Inc
    TICK:	928	PC:	49	ADDR:	4	MEM_OUT:	57	ACC:	56	Machine.Inc
    TICK:	930	PC:	50	ADDR:	4	MEM_OUT:	58	ACC:	57	Machine.Right
    TICK:	931	PC:	51	ADDR:	5	MEM_OUT:	20	ACC:	57	Machine.Inc
    TICK:	933	PC:	52	ADDR:	5	MEM_OUT:	21	ACC:	20	Machine.Left
    TICK:	934	PC:	53	ADDR:	4	MEM_OUT:	58	ACC:	20	Machine.Left
    TICK:	935	PC:	54	ADDR:	3	MEM_OUT:	68	ACC:	20	Machine.Left
    TICK:	936	PC:	55	ADDR:	2	MEM_OUT:	47	ACC:	20	Machine.Left
    TICK:	937	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	20	Machine.Dec
    TICK:	939	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jmp
    TICK:	940	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jz
    TICK:	942	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Machine.Right
    TICK:	943	PC:	40	ADDR:	2	MEM_OUT:	47	ACC:	3	Machine.Inc
    TICK:	945	PC:	41	ADDR:	2	MEM_OUT:	48	ACC:	47	Machine.Inc
    TICK:	947	PC:	42	ADDR:	2	MEM_OUT:	49	ACC:	48	Machine.Right
    TICK:	948	PC:	43	ADDR:	3	MEM_OUT:	68	ACC:	48	Machine.Inc
    TICK:	950	PC:	44	ADDR:	3	MEM_OUT:	69	ACC:	68	Machine.Inc
    TICK:	952	PC:	45	ADDR:	3	MEM_OUT:	70	ACC:	69	Machine.Inc
    TICK:	954	PC:	46	ADDR:	3	MEM_OUT:	71	ACC:	70	Machine.Right
    TICK:	955	PC:	47	ADDR:	4	MEM_OUT:	58	ACC:	70	Machine.Inc
    TICK:	957	PC:	48	ADDR:	4	MEM_OUT:	59	ACC:	58	Machine.Inc
    TICK:	959	PC:	49	ADDR:	4	MEM_OUT:	60	ACC:	59	Machine.Inc
    TICK:	961	PC:	50	ADDR:	4	MEM_OUT:	61	ACC:	60	Machine.Right
    TICK:	962	PC:	51	ADDR:	5	MEM_OUT:	21	ACC:	60	Machine.Inc
    TICK:	964	PC:	52	ADDR:	5	MEM_OUT:	22	ACC:	21	Machine.Left
    TICK:	965	PC:	53	ADDR:	4	MEM_OUT:	61	ACC:	21	Machine.Left
    TICK:	966	PC:	54	ADDR:	3	MEM_OUT:	71	ACC:	21	Machine.Left
    TICK:	967	PC:	55	ADDR:	2	MEM_OUT:	49	ACC:	21	Machine.Left
    TICK:	968	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	21	Machine.Dec
    TICK:	970	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jmp
    TICK:	971	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jz
    TICK:	973	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Machine.Right
    TICK:	974	PC:	40	ADDR:	2	MEM_OUT:	49	ACC:	2	Machine.Inc
    TICK:	976	PC:	41	ADDR:	2	MEM_OUT:	50	ACC:	49	Machine.Inc
    TICK:	978	PC:	42	ADDR:	2	MEM_OUT:	51	ACC:	50	Machine.Right
    TICK:	979	PC:	43	ADDR:	3	MEM_OUT:	71	ACC:	50	Machine.Inc
    TICK:	981	PC:	44	ADDR:	3	MEM_OUT:	72	ACC:	71	Machine.Inc
    TICK:	983	PC:	45	ADDR:	3	MEM_OUT:	73	ACC:	72	Machine.Inc
    TICK:	985	PC:	46	ADDR:	3	MEM_OUT:	74	ACC:	73	Machine.Right
    TICK:	986	PC:	47	ADDR:	4	MEM_OUT:	61	ACC:	73	Machine.Inc
    TICK:	988	PC:	48	ADDR:	4	MEM_OUT:	62	ACC:	61	Machine.Inc
    TICK:	990	PC:	49	ADDR:	4	MEM_OUT:	63	ACC:	62	Machine.Inc
    TICK:	992	PC:	50	ADDR:	4	MEM_OUT:	64	ACC:	63	Machine.Right
    TICK:	993	PC:	51	ADDR:	5	MEM_OUT:	22	ACC:	63	Machine.Inc
    TICK:	995	PC:	52	ADDR:	5	MEM_OUT:	23	ACC:	22	Machine.Left
    TICK:	996	PC:	53	ADDR:	4	MEM_OUT:	64	ACC:	22	Machine.Left
    TICK:	997	PC:	54	ADDR:	3	MEM_OUT:	74	ACC:	22	Machine.Left
    TICK:	998	PC:	55	ADDR:	2	MEM_OUT:	51	ACC:	22	Machine.Left
    TICK:	999	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	22	Machine.Dec
    TICK:	1001	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jmp
    TICK:	1002	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jz
    TICK:	1004	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Machine.Right
    TICK:	1005	PC:	40	ADDR:	2	MEM_OUT:	51	ACC:	1	Machine.Inc
    TICK:	1007	PC:	41	ADDR:	2	MEM_OUT:	52	ACC:	51	Machine.Inc
    TICK:	1009	PC:	42	ADDR:	2	MEM_OUT:	53	ACC:	52	Machine.Right
    TICK:	1010	PC:	43	ADDR:	3	MEM_OUT:	74	ACC:	52	Machine.Inc
    TICK:	1012	PC:	44	ADDR:	3	MEM_OUT:	75	ACC:	74	Machine.Inc
    TICK:	1014	PC:	45	ADDR:	3	MEM_OUT:	76	ACC:	75	Machine.Inc
    TICK:	1016	PC:	46	ADDR:	3	MEM_OUT:	77	ACC:	76	Machine.Right
    TICK:	1017	PC:	47	ADDR:	4	MEM_OUT:	64	ACC:	76	Machine.Inc
    TICK:	1019	PC:	48	ADDR:	4	MEM_OUT:	65	ACC:	64	Machine.Inc
    TICK:	1021	PC:	49	ADDR:	4	MEM_OUT:	66	ACC:	65	Machine.Inc
    TICK:	1023	PC:	50	ADDR:	4	MEM_OUT:	67	ACC:	66	Machine.Right
    TICK:	1024	PC:	51	ADDR:	5	MEM_OUT:	23	ACC:	66	Machine.Inc
    TICK:	1026	PC:	52	ADDR:	5	MEM_OUT:	24	ACC:	23	Machine.Left
    TICK:	1027	PC:	53	ADDR:	4	MEM_OUT:	67	ACC:	23	Machine.Left
    TICK:	1028	PC:	54	ADDR:	3	MEM_OUT:	77	ACC:	23	Machine.Left
    TICK:	1029	PC:	55	ADDR:	2	MEM_OUT:	53	ACC:	23	Machine.Left
    TICK:	1030	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	23	Machine.Dec
    TICK:	1032	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jmp
    TICK:	1033	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jz
    TICK:	1035	PC:	58	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	1036	PC:	59	ADDR:	2	MEM_OUT:	53	ACC:	0	Machine.Inc
    TICK:	1038	PC:	60	ADDR:	2	MEM_OUT:	54	ACC:	53	Machine.Right
    TICK:	1039	PC:	61	ADDR:	3	MEM_OUT:	77	ACC:	53	Machine.Inc
    TICK:	1041	PC:	62	ADDR:	3	MEM_OUT:	78	ACC:	77	Machine.Right
    TICK:	1042	PC:	63	ADDR:	4	MEM_OUT:	67	ACC:	77	Machine.Dec
    TICK:	1044	PC:	64	ADDR:	4	MEM_OUT:	66	ACC:	67	Machine.Right
    TICK:	1045	PC:	65	ADDR:	5	MEM_OUT:	24	ACC:	67	Machine.Right
    TICK:	1046	PC:	66	ADDR:	6	MEM_OUT:	5	ACC:	67	Machine.Inc
    TICK:	1048	PC:	67	ADDR:	6	MEM_OUT:	6	ACC:	5	Machine.Jz
    TICK:	1050	PC:	68	ADDR:	6	MEM_OUT:	6	ACC:	6	Machine.Left
    TICK:	1051	PC:	69	ADDR:	5	MEM_OUT:	24	ACC:	6	Machine.Jmp
    TICK:	1052	PC:	67	ADDR:	5	MEM_OUT:	24	ACC:	6	Machine.Jz
    TICK:	1054	PC:	68	ADDR:	5	MEM_OUT:	24	ACC:	24	Machine.Left
    TICK:	1055	PC:	69	ADDR:	4	MEM_OUT:	66	ACC:	24	Machine.Jmp
    TICK:	1056	PC:	67	ADDR:	4	MEM_OUT:	66	ACC:	24	Machine.Jz
    TICK:	1058	PC:	68	ADDR:	4	MEM_OUT:	66	ACC:	66	Machine.Left
    TICK:	1059	PC:	69	ADDR:	3	MEM_OUT:	78	ACC:	66	Machine.Jmp
    TICK:	1060	PC:	67	ADDR:	3	MEM_OUT:	78	ACC:	66	Machine.Jz
    TICK:	1062	PC:	68	ADDR:	3	MEM_OUT:	78	ACC:	78	Machine.Left
    TICK:	1063	PC:	69	ADDR:	2	MEM_OUT:	54	ACC:	78	Machine.Jmp
    TICK:	1064	PC:	67	ADDR:	2	MEM_OUT:	54	ACC:	78	Machine.Jz
    TICK:	1066	PC:	68	ADDR:	2	MEM_OUT:	54	ACC:	54	Machine.Left
    TICK:	1067	PC:	69	ADDR:	1	MEM_OUT:	0	ACC:	54	Machine.Jmp
    TICK:	1068	PC:	67	ADDR:	1	MEM_OUT:	0	ACC:	54	Machine.Jz
    TICK:	1070	PC:	70	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Left
    TICK:	1071	PC:	71	ADDR:	0	MEM_OUT:	3	ACC:	0	Machine.Dec
    TICK:	1073	PC:	72	ADDR:	0	MEM_OUT:	2	ACC:	3	Machine.Jmp
    TICK:	1074	PC:	32	ADDR:	0	MEM_OUT:	2	ACC:	3	Machine.Jz
    TICK:	1076	PC:	33	ADDR:	0	MEM_OUT:	2	ACC:	2	Machine.Right
    TICK:	1077	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	2	Machine.Inc
    TICK:	1079	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	1081	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	1083	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	1085	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Machine.Jz
    TICK:	1087	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Machine.Right
    TICK:	1088	PC:	40	ADDR:	2	MEM_OUT:	54	ACC:	4	Machine.Inc
    TICK:	1090	PC:	41	ADDR:	2	MEM_OUT:	55	ACC:	54	Machine.Inc
    TICK:	1092	PC:	42	ADDR:	2	MEM_OUT:	56	ACC:	55	Machine.Right
    TICK:	1093	PC:	43	ADDR:	3	MEM_OUT:	78	ACC:	55	Machine.Inc
    TICK:	1095	PC:	44	ADDR:	3	MEM_OUT:	79	ACC:	78	Machine.Inc
    TICK:	1097	PC:	45	ADDR:	3	MEM_OUT:	80	ACC:	79	Machine.Inc
    TICK:	1099	PC:	46	ADDR:	3	MEM_OUT:	81	ACC:	80	Machine.Right
    TICK:	1100	PC:	47	ADDR:	4	MEM_OUT:	66	ACC:	80	Machine.Inc
    TICK:	1102	PC:	48	ADDR:	4	MEM_OUT:	67	ACC:	66	Machine.Inc
    TICK:	1104	PC:	49	ADDR:	4	MEM_OUT:	68	ACC:	67	Machine.Inc
    TICK:	1106	PC:	50	ADDR:	4	MEM_OUT:	69	ACC:	68	Machine.Right
    TICK:	1107	PC:	51	ADDR:	5	MEM_OUT:	24	ACC:	68	Machine.Inc
    TICK:	1109	PC:	52	ADDR:	5	MEM_OUT:	25	ACC:	24	Machine.Left
    TICK:	1110	PC:	53	ADDR:	4	MEM_OUT:	69	ACC:	24	Machine.Left
    TICK:	1111	PC:	54	ADDR:	3	MEM_OUT:	81	ACC:	24	Machine.Left
    TICK:	1112	PC:	55	ADDR:	2	MEM_OUT:	56	ACC:	24	Machine.Left
    TICK:	1113	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	24	Machine.Dec
    TICK:	1115	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jmp
    TICK:	1116	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jz
    TICK:	1118	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Machine.Right
    TICK:	1119	PC:	40	ADDR:	2	MEM_OUT:	56	ACC:	3	Machine.Inc
    TICK:	1121	PC:	41	ADDR:	2	MEM_OUT:	57	ACC:	56	Machine.Inc
    TICK:	1123	PC:	42	ADDR:	2	MEM_OUT:	58	ACC:	57	Machine.Right
    TICK:	1124	PC:	43	ADDR:	3	MEM_OUT:	81	ACC:	57	Machine.Inc
    TICK:	1126	PC:	44	ADDR:	3	MEM_OUT:	82	ACC:	81	Machine.Inc
    TICK:	1128	PC:	45	ADDR:	3	MEM_OUT:	83	ACC:	82	Machine.Inc
    TICK:	1130	PC:	46	ADDR:	3	MEM_OUT:	84	ACC:	83	Machine.Right
    TICK:	1131	PC:	47	ADDR:	4	MEM_OUT:	69	ACC:	83	Machine.Inc
    TICK:	1133	PC:	48	ADDR:	4	MEM_OUT:	70	ACC:	69	Machine.Inc
    TICK:	1135	PC:	49	ADDR:	4	MEM_OUT:	71	ACC:	70	Machine.Inc
    TICK:	1137	PC:	50	ADDR:	4	MEM_OUT:	72	ACC:	71	Machine.Right
    TICK:	1138	PC:	51	ADDR:	5	MEM_OUT:	25	ACC:	71	Machine.Inc
    TICK:	1140	PC:	52	ADDR:	5	MEM_OUT:	26	ACC:	25	Machine.Left
    TICK:	1141	PC:	53	ADDR:	4	MEM_OUT:	72	ACC:	25	Machine.Left
    TICK:	1142	PC:	54	ADDR:	3	MEM_OUT:	84	ACC:	25	Machine.Left
    TICK:	1143	PC:	55	ADDR:	2	MEM_OUT:	58	ACC:	25	Machine.Left
    TICK:	1144	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	25	Machine.Dec
    TICK:	1146	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jmp
    TICK:	1147	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jz
    TICK:	1149	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Machine.Right
    TICK:	1150	PC:	40	ADDR:	2	MEM_OUT:	58	ACC:	2	Machine.Inc
    TICK:	1152	PC:	41	ADDR:	2	MEM_OUT:	59	ACC:	58	Machine.Inc
    TICK:	1154	PC:	42	ADDR:	2	MEM_OUT:	60	ACC:	59	Machine.Right
    TICK:	1155	PC:	43	ADDR:	3	MEM_OUT:	84	ACC:	59	Machine.Inc
    TICK:	1157	PC:	44	ADDR:	3	MEM_OUT:	85	ACC:	84	Machine.Inc
    TICK:	1159	PC:	45	ADDR:	3	MEM_OUT:	86	ACC:	85	Machine.Inc
    TICK:	1161	PC:	46	ADDR:	3	MEM_OUT:	87	ACC:	86	Machine.Right
    TICK:	1162	PC:	47	ADDR:	4	MEM_OUT:	72	ACC:	86	Machine.Inc
    TICK:	1164	PC:	48	ADDR:	4	MEM_OUT:	73	ACC:	72	Machine.Inc
    TICK:	1166	PC:	49	ADDR:	4	MEM_OUT:	74	ACC:	73	Machine.Inc
    TICK:	1168	PC:	50	ADDR:	4	MEM_OUT:	75	ACC:	74	Machine.Right
    TICK:	1169	PC:	51	ADDR:	5	MEM_OUT:	26	ACC:	74	Machine.Inc
    TICK:	1171	PC:	52	ADDR:	5	MEM_OUT:	27	ACC:	26	Machine.Left
    TICK:	1172	PC:	53	ADDR:	4	MEM_OUT:	75	ACC:	26	Machine.Left
    TICK:	1173	PC:	54	ADDR:	3	MEM_OUT:	87	ACC:	26	Machine.Left
    TICK:	1174	PC:	55	ADDR:	2	MEM_OUT:	60	ACC:	26	Machine.Left
    TICK:	1175	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	26	Machine.Dec
    TICK:	1177	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jmp
    TICK:	1178	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jz
    TICK:	1180	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Machine.Right
    TICK:	1181	PC:	40	ADDR:	2	MEM_OUT:	60	ACC:	1	Machine.Inc
    TICK:	1183	PC:	41	ADDR:	2	MEM_OUT:	61	ACC:	60	Machine.Inc
    TICK:	1185	PC:	42	ADDR:	2	MEM_OUT:	62	ACC:	61	Machine.Right
    TICK:	1186	PC:	43	ADDR:	3	MEM_OUT:	87	ACC:	61	Machine.Inc
    TICK:	1188	PC:	44	ADDR:	3	MEM_OUT:	88	ACC:	87	Machine.Inc
    TICK:	1190	PC:	45	ADDR:	3	MEM_OUT:	89	ACC:	88	Machine.Inc
    TICK:	1192	PC:	46	ADDR:	3	MEM_OUT:	90	ACC:	89	Machine.Right
    TICK:	1193	PC:	47	ADDR:	4	MEM_OUT:	75	ACC:	89	Machine.Inc
    TICK:	1195	PC:	48	ADDR:	4	MEM_OUT:	76	ACC:	75	Machine.Inc
    TICK:	1197	PC:	49	ADDR:	4	MEM_OUT:	77	ACC:	76	Machine.Inc
    TICK:	1199	PC:	50	ADDR:	4	MEM_OUT:	78	ACC:	77	Machine.Right
    TICK:	1200	PC:	51	ADDR:	5	MEM_OUT:	27	ACC:	77	Machine.Inc
    TICK:	1202	PC:	52	ADDR:	5	MEM_OUT:	28	ACC:	27	Machine.Left
    TICK:	1203	PC:	53	ADDR:	4	MEM_OUT:	78	ACC:	27	Machine.Left
    TICK:	1204	PC:	54	ADDR:	3	MEM_OUT:	90	ACC:	27	Machine.Left
    TICK:	1205	PC:	55	ADDR:	2	MEM_OUT:	62	ACC:	27	Machine.Left
    TICK:	1206	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	27	Machine.Dec
    TICK:	1208	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jmp
    TICK:	1209	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jz
    TICK:	1211	PC:	58	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	1212	PC:	59	ADDR:	2	MEM_OUT:	62	ACC:	0	Machine.Inc
    TICK:	1214	PC:	60	ADDR:	2	MEM_OUT:	63	ACC:	62	Machine.Right
    TICK:	1215	PC:	61	ADDR:	3	MEM_OUT:	90	ACC:	62	Machine.Inc
    TICK:	1217	PC:	62	ADDR:	3	MEM_OUT:	91	ACC:	90	Machine.Right
    TICK:	1218	PC:	63	ADDR:	4	MEM_OUT:	78	ACC:	90	Machine.Dec
    TICK:	1220	PC:	64	ADDR:	4	MEM_OUT:	77	ACC:	78	Machine.Right
    TICK:	1221	PC:	65	ADDR:	5	MEM_OUT:	28	ACC:	78	Machine.Right
    TICK:	1222	PC:	66	ADDR:	6	MEM_OUT:	6	ACC:	78	Machine.Inc
    TICK:	1224	PC:	67	ADDR:	6	MEM_OUT:	7	ACC:	6	Machine.Jz
    TICK:	1226	PC:	68	ADDR:	6	MEM_OUT:	7	ACC:	7	Machine.Left
    TICK:	1227	PC:	69	ADDR:	5	MEM_OUT:	28	ACC:	7	Machine.Jmp
    TICK:	1228	PC:	67	ADDR:	5	MEM_OUT:	28	ACC:	7	Machine.Jz
    TICK:	1230	PC:	68	ADDR:	5	MEM_OUT:	28	ACC:	28	Machine.Left
    TICK:	1231	PC:	69	ADDR:	4	MEM_OUT:	77	ACC:	28	Machine.Jmp
    TICK:	1232	PC:	67	ADDR:	4	MEM_OUT:	77	ACC:	28	Machine.Jz
    TICK:	1234	PC:	68	ADDR:	4	MEM_OUT:	77	ACC:	77	Machine.Left
    TICK:	1235	PC:	69	ADDR:	3	MEM_OUT:	91	ACC:	77	Machine.Jmp
    TICK:	1236	PC:	67	ADDR:	3	MEM_OUT:	91	ACC:	77	Machine.Jz
    TICK:	1238	PC:	68	ADDR:	3	MEM_OUT:	91	ACC:	91	Machine.Left
    TICK:	1239	PC:	69	ADDR:	2	MEM_OUT:	63	ACC:	91	Machine.Jmp
    TICK:	1240	PC:	67	ADDR:	2	MEM_OUT:	63	ACC:	91	Machine.Jz
    TICK:	1242	PC:	68	ADDR:	2	MEM_OUT:	63	ACC:	63	Machine.Left
    TICK:	1243	PC:	69	ADDR:	1	MEM_OUT:	0	ACC:	63	Machine.Jmp
    TICK:	1244	PC:	67	ADDR:	1	MEM_OUT:	0	ACC:	63	Machine.Jz
    TICK:	1246	PC:	70	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Left
    TICK:	1247	PC:	71	ADDR:	0	MEM_OUT:	2	ACC:	0	Machine.Dec
    TICK:	1249	PC:	72	ADDR:	0	MEM_OUT:	1	ACC:	2	Machine.Jmp
    TICK:	1250	PC:	32	ADDR:	0	MEM_OUT:	1	ACC:	2	Machine.Jz
    TICK:	1252	PC:	33	ADDR:	0	MEM_OUT:	1	ACC:	1	Machine.Right
    TICK:	1253	PC:	34	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Inc
    TICK:	1255	PC:	35	ADDR:	1	MEM_OUT:	1	ACC:	0	Machine.Inc
    TICK:	1257	PC:	36	ADDR:	1	MEM_OUT:	2	ACC:	1	Machine.Inc
    TICK:	1259	PC:	37	ADDR:	1	MEM_OUT:	3	ACC:	2	Machine.Inc
    TICK:	1261	PC:	38	ADDR:	1	MEM_OUT:	4	ACC:	3	Machine.Jz
    TICK:	1263	PC:	39	ADDR:	1	MEM_OUT:	4	ACC:	4	Machine.Right
    TICK:	1264	PC:	40	ADDR:	2	MEM_OUT:	63	ACC:	4	Machine.Inc
    TICK:	1266	PC:	41	ADDR:	2	MEM_OUT:	64	ACC:	63	Machine.Inc
    TICK:	1268	PC:	42	ADDR:	2	MEM_OUT:	65	ACC:	64	Machine.Right
    TICK:	1269	PC:	43	ADDR:	3	MEM_OUT:	91	ACC:	64	Machine.Inc
    TICK:	1271	PC:	44	ADDR:	3	MEM_OUT:	92	ACC:	91	Machine.Inc
    TICK:	1273	PC:	45	ADDR:	3	MEM_OUT:	93	ACC:	92	Machine.Inc
    TICK:	1275	PC:	46	ADDR:	3	MEM_OUT:	94	ACC:	93	Machine.Right
    TICK:	1276	PC:	47	ADDR:	4	MEM_OUT:	77	ACC:	93	Machine.Inc
    TICK:	1278	PC:	48	ADDR:	4	MEM_OUT:	78	ACC:	77	Machine.Inc
    TICK:	1280	PC:	49	ADDR:	4	MEM_OUT:	79	ACC:	78	Machine.Inc
    TICK:	1282	PC:	50	ADDR:	4	MEM_OUT:	80	ACC:	79	Machine.Right
    TICK:	1283	PC:	51	ADDR:	5	MEM_OUT:	28	ACC:	79	Machine.Inc
    TICK:	1285	PC:	52	ADDR:	5	MEM_OUT:	29	ACC:	28	Machine.Left
    TICK:	1286	PC:	53	ADDR:	4	MEM_OUT:	80	ACC:	28	Machine.Left
    TICK:	1287	PC:	54	ADDR:	3	MEM_OUT:	94	ACC:	28	Machine.Left
    TICK:	1288	PC:	55	ADDR:	2	MEM_OUT:	65	ACC:	28	Machine.Left
    TICK:	1289	PC:	56	ADDR:	1	MEM_OUT:	4	ACC:	28	Machine.Dec
    TICK:	1291	PC:	57	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jmp
    TICK:	1292	PC:	38	ADDR:	1	MEM_OUT:	3	ACC:	4	Machine.Jz
    TICK:	1294	PC:	39	ADDR:	1	MEM_OUT:	3	ACC:	3	Machine.Right
    TICK:	1295	PC:	40	ADDR:	2	MEM_OUT:	65	ACC:	3	Machine.Inc
    TICK:	1297	PC:	41	ADDR:	2	MEM_OUT:	66	ACC:	65	Machine.Inc
    TICK:	1299	PC:	42	ADDR:	2	MEM_OUT:	67	ACC:	66	Machine.Right
    TICK:	1300	PC:	43	ADDR:	3	MEM_OUT:	94	ACC:	66	Machine.Inc
    TICK:	1302	PC:	44	ADDR:	3	MEM_OUT:	95	ACC:	94	Machine.Inc
    TICK:	1304	PC:	45	ADDR:	3	MEM_OUT:	96	ACC:	95	Machine.Inc
    TICK:	1306	PC:	46	ADDR:	3	MEM_OUT:	97	ACC:	96	Machine.Right
    TICK:	1307	PC:	47	ADDR:	4	MEM_OUT:	80	ACC:	96	Machine.Inc
    TICK:	1309	PC:	48	ADDR:	4	MEM_OUT:	81	ACC:	80	Machine.Inc
    TICK:	1311	PC:	49	ADDR:	4	MEM_OUT:	82	ACC:	81	Machine.Inc
    TICK:	1313	PC:	50	ADDR:	4	MEM_OUT:	83	ACC:	82	Machine.Right
    TICK:	1314	PC:	51	ADDR:	5	MEM_OUT:	29	ACC:	82	Machine.Inc
    TICK:	1316	PC:	52	ADDR:	5	MEM_OUT:	30	ACC:	29	Machine.Left
    TICK:	1317	PC:	53	ADDR:	4	MEM_OUT:	83	ACC:	29	Machine.Left
    TICK:	1318	PC:	54	ADDR:	3	MEM_OUT:	97	ACC:	29	Machine.Left
    TICK:	1319	PC:	55	ADDR:	2	MEM_OUT:	67	ACC:	29	Machine.Left
    TICK:	1320	PC:	56	ADDR:	1	MEM_OUT:	3	ACC:	29	Machine.Dec
    TICK:	1322	PC:	57	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jmp
    TICK:	1323	PC:	38	ADDR:	1	MEM_OUT:	2	ACC:	3	Machine.Jz
    TICK:	1325	PC:	39	ADDR:	1	MEM_OUT:	2	ACC:	2	Machine.Right
    TICK:	1326	PC:	40	ADDR:	2	MEM_OUT:	67	ACC:	2	Machine.Inc
    TICK:	1328	PC:	41	ADDR:	2	MEM_OUT:	68	ACC:	67	Machine.Inc
    TICK:	1330	PC:	42	ADDR:	2	MEM_OUT:	69	ACC:	68	Machine.Right
    TICK:	1331	PC:	43	ADDR:	3	MEM_OUT:	97	ACC:	68	Machine.Inc
    TICK:	1333	PC:	44	ADDR:	3	MEM_OUT:	98	ACC:	97	Machine.Inc
    TICK:	1335	PC:	45	ADDR:	3	MEM_OUT:	99	ACC:	98	Machine.Inc
    TICK:	1337	PC:	46	ADDR:	3	MEM_OUT:	100	ACC:	99	Machine.Right
    TICK:	1338	PC:	47	ADDR:	4	MEM_OUT:	83	ACC:	99	Machine.Inc
    TICK:	1340	PC:	48	ADDR:	4	MEM_OUT:	84	ACC:	83	Machine.Inc
    TICK:	1342	PC:	49	ADDR:	4	MEM_OUT:	85	ACC:	84	Machine.Inc
    TICK:	1344	PC:	50	ADDR:	4	MEM_OUT:	86	ACC:	85	Machine.Right
    TICK:	1345	PC:	51	ADDR:	5	MEM_OUT:	30	ACC:	85	Machine.Inc
    TICK:	1347	PC:	52	ADDR:	5	MEM_OUT:	31	ACC:	30	Machine.Left
    TICK:	1348	PC:	53	ADDR:	4	MEM_OUT:	86	ACC:	30	Machine.Left
    TICK:	1349	PC:	54	ADDR:	3	MEM_OUT:	100	ACC:	30	Machine.Left
    TICK:	1350	PC:	55	ADDR:	2	MEM_OUT:	69	ACC:	30	Machine.Left
    TICK:	1351	PC:	56	ADDR:	1	MEM_OUT:	2	ACC:	30	Machine.Dec
    TICK:	1353	PC:	57	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jmp
    TICK:	1354	PC:	38	ADDR:	1	MEM_OUT:	1	ACC:	2	Machine.Jz
    TICK:	1356	PC:	39	ADDR:	1	MEM_OUT:	1	ACC:	1	Machine.Right
    TICK:	1357	PC:	40	ADDR:	2	MEM_OUT:	69	ACC:	1	Machine.Inc
    TICK:	1359	PC:	41	ADDR:	2	MEM_OUT:	70	ACC:	69	Machine.Inc
    TICK:	1361	PC:	42	ADDR:	2	MEM_OUT:	71	ACC:	70	Machine.Right
    TICK:	1362	PC:	43	ADDR:	3	MEM_OUT:	100	ACC:	70	Machine.Inc
    TICK:	1364	PC:	44	ADDR:	3	MEM_OUT:	101	ACC:	100	Machine.Inc
    TICK:	1366	PC:	45	ADDR:	3	MEM_OUT:	102	ACC:	101	Machine.Inc
    TICK:	1368	PC:	46	ADDR:	3	MEM_OUT:	103	ACC:	102	Machine.Right
    TICK:	1369	PC:	47	ADDR:	4	MEM_OUT:	86	ACC:	102	Machine.Inc
    TICK:	1371	PC:	48	ADDR:	4	MEM_OUT:	87	ACC:	86	Machine.Inc
    TICK:	1373	PC:	49	ADDR:	4	MEM_OUT:	88	ACC:	87	Machine.Inc
    TICK:	1375	PC:	50	ADDR:	4	MEM_OUT:	89	ACC:	88	Machine.Right
    TICK:	1376	PC:	51	ADDR:	5	MEM_OUT:	31	ACC:	88	Machine.Inc
    TICK:	1378	PC:	52	ADDR:	5	MEM_OUT:	32	ACC:	31	Machine.Left
    TICK:	1379	PC:	53	ADDR:	4	MEM_OUT:	89	ACC:	31	Machine.Left
    TICK:	1380	PC:	54	ADDR:	3	MEM_OUT:	103	ACC:	31	Machine.Left
    TICK:	1381	PC:	55	ADDR:	2	MEM_OUT:	71	ACC:	31	Machine.Left
    TICK:	1382	PC:	56	ADDR:	1	MEM_OUT:	1	ACC:	31	Machine.Dec
    TICK:	1384	PC:	57	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jmp
    TICK:	1385	PC:	38	ADDR:	1	MEM_OUT:	0	ACC:	1	Machine.Jz
    TICK:	1387	PC:	58	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	1388	PC:	59	ADDR:	2	MEM_OUT:	71	ACC:	0	Machine.Inc
    TICK:	1390	PC:	60	ADDR:	2	MEM_OUT:	72	ACC:	71	Machine.Right
    TICK:	1391	PC:	61	ADDR:	3	MEM_OUT:	103	ACC:	71	Machine.Inc
    TICK:	1393	PC:	62	ADDR:	3	MEM_OUT:	104	ACC:	103	Machine.Right
    TICK:	1394	PC:	63	ADDR:	4	MEM_OUT:	89	ACC:	103	Machine.Dec
    TICK:	1396	PC:	64	ADDR:	4	MEM_OUT:	88	ACC:	89	Machine.Right
    TICK:	1397	PC:	65	ADDR:	5	MEM_OUT:	32	ACC:	89	Machine.Right
    TICK:	1398	PC:	66	ADDR:	6	MEM_OUT:	7	ACC:	89	Machine.Inc
    TICK:	1400	PC:	67	ADDR:	6	MEM_OUT:	8	ACC:	7	Machine.Jz
    TICK:	1402	PC:	68	ADDR:	6	MEM_OUT:	8	ACC:	8	Machine.Left
    TICK:	1403	PC:	69	ADDR:	5	MEM_OUT:	32	ACC:	8	Machine.Jmp
    TICK:	1404	PC:	67	ADDR:	5	MEM_OUT:	32	ACC:	8	Machine.Jz
    TICK:	1406	PC:	68	ADDR:	5	MEM_OUT:	32	ACC:	32	Machine.Left
    TICK:	1407	PC:	69	ADDR:	4	MEM_OUT:	88	ACC:	32	Machine.Jmp
    TICK:	1408	PC:	67	ADDR:	4	MEM_OUT:	88	ACC:	32	Machine.Jz
    TICK:	1410	PC:	68	ADDR:	4	MEM_OUT:	88	ACC:	88	Machine.Left
    TICK:	1411	PC:	69	ADDR:	3	MEM_OUT:	104	ACC:	88	Machine.Jmp
    TICK:	1412	PC:	67	ADDR:	3	MEM_OUT:	104	ACC:	88	Machine.Jz
    TICK:	1414	PC:	68	ADDR:	3	MEM_OUT:	104	ACC:	104	Machine.Left
    TICK:	1415	PC:	69	ADDR:	2	MEM_OUT:	72	ACC:	104	Machine.Jmp
    TICK:	1416	PC:	67	ADDR:	2	MEM_OUT:	72	ACC:	104	Machine.Jz
    TICK:	1418	PC:	68	ADDR:	2	MEM_OUT:	72	ACC:	72	Machine.Left
    TICK:	1419	PC:	69	ADDR:	1	MEM_OUT:	0	ACC:	72	Machine.Jmp
    TICK:	1420	PC:	67	ADDR:	1	MEM_OUT:	0	ACC:	72	Machine.Jz
    TICK:	1422	PC:	70	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Left
    TICK:	1423	PC:	71	ADDR:	0	MEM_OUT:	1	ACC:	0	Machine.Dec
    TICK:	1425	PC:	72	ADDR:	0	MEM_OUT:	0	ACC:	1	Machine.Jmp
    TICK:	1426	PC:	32	ADDR:	0	MEM_OUT:	0	ACC:	1	Machine.Jz
    TICK:	1428	PC:	73	ADDR:	0	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	1429	PC:	74	ADDR:	1	MEM_OUT:	0	ACC:	0	Machine.Right
    TICK:	1430	PC:	75	ADDR:	2	MEM_OUT:	72	ACC:	0	Machine.Print
    TICK:	1432	PC:	76	ADDR:	2	MEM_OUT:	72	ACC:	72	Machine.Right
    TICK:	1433	PC:	77	ADDR:	3	MEM_OUT:	104	ACC:	72	Machine.Dec
    TICK:	1435	PC:	78	ADDR:	3	MEM_OUT:	103	ACC:	104	Machine.Dec
    TICK:	1437	PC:	79	ADDR:	3	MEM_OUT:	102	ACC:	103	Machine.Dec
    TICK:	1439	PC:	80	ADDR:	3	MEM_OUT:	101	ACC:	102	Machine.Print
    TICK:	1441	PC:	81	ADDR:	3	MEM_OUT:	101	ACC:	101	Machine.Inc
    TICK:	1443	PC:	82	ADDR:	3	MEM_OUT:	102	ACC:	101	Machine.Inc
    TICK:	1445	PC:	83	ADDR:	3	MEM_OUT:	103	ACC:	102	Machine.Inc
    TICK:	1447	PC:	84	ADDR:	3	MEM_OUT:	104	ACC:	103	Machine.Inc
    TICK:	1449	PC:	85	ADDR:	3	MEM_OUT:	105	ACC:	104	Machine.Inc
    TICK:	1451	PC:	86	ADDR:	3	MEM_OUT:	106	ACC:	105	Machine.Inc
    TICK:	1453	PC:	87	ADDR:	3	MEM_OUT:	107	ACC:	106	Machine.Inc
    TICK:	1455	PC:	88	ADDR:	3	MEM_OUT:	108	ACC:	107	Machine.Print
    TICK:	1457	PC:	89	ADDR:	3	MEM_OUT:	108	ACC:	108	Machine.Print
    TICK:	1459	PC:	90	ADDR:	3	MEM_OUT:	108	ACC:	108	Machine.Inc
    TICK:	1461	PC:	91	ADDR:	3	MEM_OUT:	109	ACC:	108	Machine.Inc
    TICK:	1463	PC:	92	ADDR:	3	MEM_OUT:	110	ACC:	109	Machine.Inc
    TICK:	1465	PC:	93	ADDR:	3	MEM_OUT:	111	ACC:	110	Machine.Print
    TICK:	1467	PC:	94	ADDR:	3	MEM_OUT:	111	ACC:	111	Machine.Right
    TICK:	1468	PC:	95	ADDR:	4	MEM_OUT:	88	ACC:	111	Machine.Right
    TICK:	1469	PC:	96	ADDR:	5	MEM_OUT:	32	ACC:	111	Machine.Print
    TICK:	1471	PC:	97	ADDR:	5	MEM_OUT:	32	ACC:	32	Machine.Left
    TICK:	1472	PC:	98	ADDR:	4	MEM_OUT:	88	ACC:	32	Machine.Dec
    TICK:	1474	PC:	99	ADDR:	4	MEM_OUT:	87	ACC:	88	Machine.Print
    TICK:	1476	PC:	100	ADDR:	4	MEM_OUT:	87	ACC:	87	Machine.Left
    TICK:	1477	PC:	101	ADDR:	3	MEM_OUT:	111	ACC:	87	Machine.Print
    TICK:	1479	PC:	102	ADDR:	3	MEM_OUT:	111	ACC:	111	Machine.Inc
    TICK:	1481	PC:	103	ADDR:	3	MEM_OUT:	112	ACC:	111	Machine.Inc
    TICK:	1483	PC:	104	ADDR:	3	MEM_OUT:	113	ACC:	112	Machine.Inc
    TICK:	1485	PC:	105	ADDR:	3	MEM_OUT:	114	ACC:	113	Machine.Print
    TICK:	1487	PC:	106	ADDR:	3	MEM_OUT:	114	ACC:	114	Machine.Dec
    TICK:	1489	PC:	107	ADDR:	3	MEM_OUT:	113	ACC:	114	Machine.Dec
    TICK:	1491	PC:	108	ADDR:	3	MEM_OUT:	112	ACC:	113	Machine.Dec
    TICK:	1493	PC:	109	ADDR:	3	MEM_OUT:	111	ACC:	112	Machine.Dec
    TICK:	1495	PC:	110	ADDR:	3	MEM_OUT:	110	ACC:	111	Machine.Dec
    TICK:	1497	PC:	111	ADDR:	3	MEM_OUT:	109	ACC:	110	Machine.Dec
    TICK:	1499	PC:	112	ADDR:	3	MEM_OUT:	108	ACC:	109	Machine.Print
    TICK:	1501	PC:	113	ADDR:	3	MEM_OUT:	108	ACC:	108	Machine.Dec
    TICK:	1503	PC:	114	ADDR:	3	MEM_OUT:	107	ACC:	108	Machine.Dec
    TICK:	1505	PC:	115	ADDR:	3	MEM_OUT:	106	ACC:	107	Machine.Dec
    TICK:	1507	PC:	116	ADDR:	3	MEM_OUT:	105	ACC:	106	Machine.Dec
    TICK:	1509	PC:	117	ADDR:	3	MEM_OUT:	104	ACC:	105	Machine.Dec
    TICK:	1511	PC:	118	ADDR:	3	MEM_OUT:	103	ACC:	104	Machine.Dec
    TICK:	1513	PC:	119	ADDR:	3	MEM_OUT:	102	ACC:	103	Machine.Dec
    TICK:	1515	PC:	120	ADDR:	3	MEM_OUT:	101	ACC:	102	Machine.Dec
    TICK:	1517	PC:	121	ADDR:	3	MEM_OUT:	100	ACC:	101	Machine.Print
    TICK:	1519	PC:	122	ADDR:	3	MEM_OUT:	100	ACC:	100	Machine.Right
    TICK:	1520	PC:	123	ADDR:	4	MEM_OUT:	87	ACC:	100	Machine.Right
    TICK:	1521	PC:	124	ADDR:	5	MEM_OUT:	32	ACC:	100	Machine.Inc
    TICK:	1523	PC:	125	ADDR:	5	MEM_OUT:	33	ACC:	32	Machine.Print
    TICK:	1525	PC:	126	ADDR:	5	MEM_OUT:	33	ACC:	33	Machine.Right
    TICK:	1526	PC:	127	ADDR:	6	MEM_OUT:	8	ACC:	33	Machine.Inc
    TICK:	1528	PC:	128	ADDR:	6	MEM_OUT:	9	ACC:	8	Machine.Inc
    TICK:	1530	PC:	129	ADDR:	6	MEM_OUT:	10	ACC:	9	Machine.Print
    TICK:	1532	PC:	130	ADDR:	6	MEM_OUT:	10	ACC:	10	Machine.Halt
    Failure("Halted.")
    { Machine.pc = 130;
      program =
      [|{ Machine.index = 23; opcode = Machine.Jz; arg = (Some 24);
          term = (Some { Machine.line = 1; pos = 1; symbol = "[" }) };
        { Machine.index = 1; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 12; pos = 7; symbol = "," }) };
        { Machine.index = 2; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 19; pos = 11; symbol = "." }) };
        { Machine.index = 5; opcode = Machine.Jz; arg = (Some 6);
          term = (Some { Machine.line = 20; pos = 1; symbol = "[" }) };
        { Machine.index = 4; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 24; pos = 9; symbol = "." }) };
        { Machine.index = 5; opcode = Machine.Jmp; arg = (Some 3);
          term = (Some { Machine.line = 24; pos = 10; symbol = "]" }) };
        { Machine.index = 6; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 31; pos = 6; symbol = "," }) };
        { Machine.index = 7; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 53; pos = 11; symbol = "." }) };
        { Machine.index = 8; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 55; pos = 2; symbol = "." }) };
        { Machine.index = 9; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 55; pos = 4; symbol = "," }) };
        { Machine.index = 10; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 56; pos = 2; symbol = "," }) };
        { Machine.index = 11; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 56; pos = 4; symbol = "," }) };
        { Machine.index = 12; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 57; pos = 2; symbol = "+" }) };
        { Machine.index = 13; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 57; pos = 4; symbol = "," }) };
        { Machine.index = 14; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 58; pos = 2; symbol = "-" }) };
        { Machine.index = 15; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 58; pos = 4; symbol = "," }) };
        { Machine.index = 16; opcode = Machine.Left; arg = None;
          term = (Some { Machine.line = 59; pos = 2; symbol = "<" }) };
        { Machine.index = 17; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 61; pos = 2; symbol = ">" }) };
        { Machine.index = 18; opcode = Machine.Input; arg = None;
          term = (Some { Machine.line = 65; pos = 8; symbol = "," }) };
        { Machine.index = 20; opcode = Machine.Jz; arg = (Some 21);
          term = (Some { Machine.line = 67; pos = 2; symbol = "[" }) };
        { Machine.index = 20; opcode = Machine.Jmp; arg = (Some 19);
          term = (Some { Machine.line = 69; pos = 2; symbol = "]" }) };
        { Machine.index = 21; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 75; pos = 9; symbol = "." }) };
        { Machine.index = 22; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 103; pos = 8; symbol = "." }) };
        { Machine.index = 23; opcode = Machine.Jmp; arg = (Some 0);
          term = (Some { Machine.line = 104; pos = 1; symbol = "]" }) };
        { Machine.index = 24; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 105; pos = 1; symbol = "+" }) };
        { Machine.index = 25; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 105; pos = 2; symbol = "+" }) };
        { Machine.index = 26; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 105; pos = 3; symbol = "+" }) };
        { Machine.index = 27; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 105; pos = 4; symbol = "+" }) };
        { Machine.index = 28; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 105; pos = 5; symbol = "+" }) };
        { Machine.index = 29; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 105; pos = 6; symbol = "+" }) };
        { Machine.index = 30; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 105; pos = 7; symbol = "+" }) };
        { Machine.index = 31; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 105; pos = 8; symbol = "+" }) };
        { Machine.index = 72; opcode = Machine.Jz; arg = (Some 73);
          term = (Some { Machine.line = 111; pos = 1; symbol = "[" }) };
        { Machine.index = 33; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 112; pos = 1; symbol = ">" }) };
        { Machine.index = 34; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 112; pos = 2; symbol = "+" }) };
        { Machine.index = 35; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 112; pos = 3; symbol = "+" }) };
        { Machine.index = 36; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 112; pos = 4; symbol = "+" }) };
        { Machine.index = 37; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 112; pos = 5; symbol = "+" }) };
        { Machine.index = 57; opcode = Machine.Jz; arg = (Some 58);
          term = (Some { Machine.line = 126; pos = 1; symbol = "[" }) };
        { Machine.index = 39; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 136; pos = 1; symbol = ">" }) };
        { Machine.index = 40; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 136; pos = 2; symbol = "+" }) };
        { Machine.index = 41; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 136; pos = 3; symbol = "+" }) };
        { Machine.index = 42; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 142; pos = 1; symbol = ">" }) };
        { Machine.index = 43; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 142; pos = 2; symbol = "+" }) };
        { Machine.index = 44; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 142; pos = 3; symbol = "+" }) };
        { Machine.index = 45; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 142; pos = 4; symbol = "+" }) };
        { Machine.index = 46; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 148; pos = 1; symbol = ">" }) };
        { Machine.index = 47; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 148; pos = 2; symbol = "+" }) };
        { Machine.index = 48; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 148; pos = 3; symbol = "+" }) };
        { Machine.index = 49; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 148; pos = 4; symbol = "+" }) };
        { Machine.index = 50; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 154; pos = 1; symbol = ">" }) };
        { Machine.index = 51; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 154; pos = 2; symbol = "+" }) };
        { Machine.index = 52; opcode = Machine.Left; arg = None;
          term = (Some { Machine.line = 160; pos = 1; symbol = "<" }) };
        { Machine.index = 53; opcode = Machine.Left; arg = None;
          term = (Some { Machine.line = 160; pos = 2; symbol = "<" }) };
        { Machine.index = 54; opcode = Machine.Left; arg = None;
          term = (Some { Machine.line = 160; pos = 3; symbol = "<" }) };
        { Machine.index = 55; opcode = Machine.Left; arg = None;
          term = (Some { Machine.line = 160; pos = 4; symbol = "<" }) };
        { Machine.index = 56; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 160; pos = 5; symbol = "-" }) };
        { Machine.index = 57; opcode = Machine.Jmp; arg = (Some 38);
          term = (Some { Machine.line = 168; pos = 1; symbol = "]" }) };
        { Machine.index = 58; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 180; pos = 1; symbol = ">" }) };
        { Machine.index = 59; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 180; pos = 2; symbol = "+" }) };
        { Machine.index = 60; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 186; pos = 1; symbol = ">" }) };
        { Machine.index = 61; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 186; pos = 2; symbol = "+" }) };
        { Machine.index = 62; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 192; pos = 1; symbol = ">" }) };
        { Machine.index = 63; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 192; pos = 2; symbol = "-" }) };
        { Machine.index = 64; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 198; pos = 1; symbol = ">" }) };
        { Machine.index = 65; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 198; pos = 2; symbol = ">" }) };
        { Machine.index = 66; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 198; pos = 3; symbol = "+" }) };
        { Machine.index = 69; opcode = Machine.Jz; arg = (Some 70);
          term = (Some { Machine.line = 204; pos = 1; symbol = "[" }) };
        { Machine.index = 68; opcode = Machine.Left; arg = None;
          term = (Some { Machine.line = 204; pos = 2; symbol = "<" }) };
        { Machine.index = 69; opcode = Machine.Jmp; arg = (Some 67);
          term = (Some { Machine.line = 204; pos = 3; symbol = "]" }) };
        { Machine.index = 70; opcode = Machine.Left; arg = None;
          term = (Some { Machine.line = 226; pos = 1; symbol = "<" }) };
        { Machine.index = 71; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 226; pos = 2; symbol = "-" }) };
        { Machine.index = 72; opcode = Machine.Jmp; arg = (Some 32);
          term = (Some { Machine.line = 234; pos = 1; symbol = "]" }) };
        { Machine.index = 73; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 272; pos = 1; symbol = ">" }) };
        { Machine.index = 74; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 272; pos = 2; symbol = ">" }) };
        { Machine.index = 75; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 272; pos = 3; symbol = "." }) };
        { Machine.index = 76; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 281; pos = 1; symbol = ">" }) };
        { Machine.index = 77; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 281; pos = 2; symbol = "-" }) };
        { Machine.index = 78; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 281; pos = 3; symbol = "-" }) };
        { Machine.index = 79; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 281; pos = 4; symbol = "-" }) };
        { Machine.index = 80; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 281; pos = 5; symbol = "." }) };
        { Machine.index = 81; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 1; symbol = "+" }) };
        { Machine.index = 82; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 2; symbol = "+" }) };
        { Machine.index = 83; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 3; symbol = "+" }) };
        { Machine.index = 84; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 4; symbol = "+" }) };
        { Machine.index = 85; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 5; symbol = "+" }) };
        { Machine.index = 86; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 6; symbol = "+" }) };
        { Machine.index = 87; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 7; symbol = "+" }) };
        { Machine.index = 88; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 293; pos = 8; symbol = "." }) };
        { Machine.index = 89; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 293; pos = 9; symbol = "." }) };
        { Machine.index = 90; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 10; symbol = "+" }) };
        { Machine.index = 91; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 11; symbol = "+" }) };
        { Machine.index = 92; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 293; pos = 12; symbol = "+" }) };
        { Machine.index = 93; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 293; pos = 13; symbol = "." }) };
        { Machine.index = 94; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 300; pos = 1; symbol = ">" }) };
        { Machine.index = 95; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 300; pos = 2; symbol = ">" }) };
        { Machine.index = 96; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 300; pos = 3; symbol = "." }) };
        { Machine.index = 97; opcode = Machine.Left; arg = None;
          term = (Some { Machine.line = 308; pos = 1; symbol = "<" }) };
        { Machine.index = 98; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 308; pos = 2; symbol = "-" }) };
        { Machine.index = 99; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 308; pos = 3; symbol = "." }) };
        { Machine.index = 100; opcode = Machine.Left; arg = None;
          term = (Some { Machine.line = 320; pos = 1; symbol = "<" }) };
        { Machine.index = 101; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 320; pos = 2; symbol = "." }) };
        { Machine.index = 102; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 332; pos = 1; symbol = "+" }) };
        { Machine.index = 103; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 332; pos = 2; symbol = "+" }) };
        { Machine.index = 104; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 332; pos = 3; symbol = "+" }) };
        { Machine.index = 105; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 332; pos = 4; symbol = "." }) };
        { Machine.index = 106; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 5; symbol = "-" }) };
        { Machine.index = 107; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 6; symbol = "-" }) };
        { Machine.index = 108; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 7; symbol = "-" }) };
        { Machine.index = 109; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 8; symbol = "-" }) };
        { Machine.index = 110; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 9; symbol = "-" }) };
        { Machine.index = 111; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 10; symbol = "-" }) };
        { Machine.index = 112; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 332; pos = 11; symbol = "." }) };
        { Machine.index = 113; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 12; symbol = "-" }) };
        { Machine.index = 114; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 13; symbol = "-" }) };
        { Machine.index = 115; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 14; symbol = "-" }) };
        { Machine.index = 116; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 15; symbol = "-" }) };
        { Machine.index = 117; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 16; symbol = "-" }) };
        { Machine.index = 118; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 17; symbol = "-" }) };
        { Machine.index = 119; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 18; symbol = "-" }) };
        { Machine.index = 120; opcode = Machine.Dec; arg = None;
          term = (Some { Machine.line = 332; pos = 19; symbol = "-" }) };
        { Machine.index = 121; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 332; pos = 20; symbol = "." }) };
        { Machine.index = 122; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 339; pos = 1; symbol = ">" }) };
        { Machine.index = 123; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 339; pos = 2; symbol = ">" }) };
        { Machine.index = 124; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 339; pos = 3; symbol = "+" }) };
        { Machine.index = 125; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 339; pos = 4; symbol = "." }) };
        { Machine.index = 126; opcode = Machine.Right; arg = None;
          term = (Some { Machine.line = 350; pos = 1; symbol = ">" }) };
        { Machine.index = 127; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 350; pos = 2; symbol = "+" }) };
        { Machine.index = 128; opcode = Machine.Inc; arg = None;
          term = (Some { Machine.line = 350; pos = 3; symbol = "+" }) };
        { Machine.index = 129; opcode = Machine.Print; arg = None;
          term = (Some { Machine.line = 350; pos = 4; symbol = "." }) };
        { Machine.index = 130; opcode = Machine.Halt; arg = None; term = None }|];
      data_path =
      { Machine.data_address = 6;
        data_memory =
        [|0; 0; 72; 100; 87; 33; 10; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0|];
        acc = 10; input_buffer = ['f'; 'o'; 'o'; '\n'];
        output_buffer =
        ['H'; 'e'; 'l'; 'l'; 'o'; ' '; 'W'; 'o'; 'r'; 'l'; 'd'; '!'; '\n'] };
      model_tick = 1532 } |}]
