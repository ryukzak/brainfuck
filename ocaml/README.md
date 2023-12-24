# Brainfuck machine, Ocaml version

Motivation:

- experiments with OCaml;
- functional programming example;
- microcoded example.

It is not a well documented example! It just an idea demonstrations.

Structure:

- `code.ml` -- types for machine code representation and JSON parser.
- `datapath.ml` -- data path types and signal handlers. The same as in Python version. Used for hardwired and microcoded implementation.
- `hardwired.ml` -- control unit with hardwired implementation. The same as in Python version but in functional style.
- `microcoded.ml` -- control unit with microcoded implementation with updated scheme.
- `microcoded.ml` -- CLI interface for machines.
- `test_cat.ml` -- golden style test for `cat`.
- `test_hello.ml` -- golden style test for `cat`.

How to:

- Just build: `dune build`
- Execute:
    - `dune exec ./machine_cli.exe hw examples/cat.json examples/foo_input.txt`
    - `dune exec ./machine_cli.exe mc examples/cat.json examples/foo_input.txt`
- Run tests: `dune runtest`
- Run tests & update expectations: `dune runtest --auto-promote`
- Format code: `dune fmt`
