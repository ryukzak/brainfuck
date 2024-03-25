# Translator + processor model for Brainfuck

Here you can find examples for laboratory work #3 of the Computer Architecture course at ITMO University. It is the imaginary variant of brainfuck language and brainfuck processor architecture.

It includes:

1. [./python/](./python/) -- full report example, and well-documented translator and machine implementation in Python language. All descriptions are in Russian.

    - with brainfuck language: [./python/README.md](./python/README.md)
    
        `brainfuck | bf | harv | hw | instr | struct | stream | port | - | - | -`

    - with asm language: [./python/README_asm.md](./python/README_asm.md)
    
        `asm | bf | harv | hw | instr | struct | stream | port | - | - | -`

1. [./ocaml/](./ocaml/) -- processor model implemented in OCaml language in functional style.

    - machine cli: [./ocaml/machine_cli.ml](./ocaml/machine_cli.ml)
    - with a hardwired control unit: [./ocaml/hardwired.ml](./ocaml/hardwired.ml)

        `- | bf | harv | hw | instr | struct | stream | port | - | - | -`

    - with a microcoded control unit: [./ocaml/microcoded.ml](./ocaml/microcoded.ml)

        `- | bf | harv | mc | instr | struct | stream | port | - | - | -`
