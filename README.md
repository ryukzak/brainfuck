# Translator + processor model for Brainfuck

Here you can find examples for laboratory work #4 of the Computer Architecture course at ITMO University. It is the imaginary variant of brainfuck language and brainfuck processor architecture.

It includes:

1. [./python/](./python/) -- full report example, and well-documented translator and machine implementation in Python language. All descriptions are in Russian.

    - with brainfuck language: [./python/README.md](./python/README.md)

        `bf_lang | bf_isa | harv | hw | stream | port | - | - | -`

    - with asm language: [./python/README_asm.md](./python/README_asm.md)

        `bf_asm | bf_isa | harv | hw | stream | port | - | - | -`[^asm-limits]

1. [./ocaml/](./ocaml/) -- processor model implemented in OCaml language in functional style.

    - machine cli: [./ocaml/machine_cli.ml](./ocaml/machine_cli.ml)
    - with a hardwired control unit: [./ocaml/hardwired.ml](./ocaml/hardwired.ml)

        `- | - | harv | hw | stream | port | - | - | -`[^ocaml-limits]

    - with a microcoded control unit: [./ocaml/microcoded.ml](./ocaml/microcoded.ml)

        `- | - | harv | mc | stream | port | - | - | -`[^ocaml-limits]

[^asm-limits]: This asm example does not support sections, `.org`, macros/conditional compilation, or separate translation with linking -- now required for `asm`. Treat it as a known gap, not as a template to copy.
[^ocaml-limits]: The machine code here is JSON, not binary -- the current task requires a binary machine code representation for everyone.
