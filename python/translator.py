#!/usr/bin/python3
"""Транслятор brainfuck в машинный код.
"""

import sys

from isa import Opcode, Term, write_code


def symbols():
    """Полное множество символов языка brainfuck."""
    return {"<", ">", "+", "-", ",", ".", "[", "]"}


def symbol2opcode(symbol):
    """Отображение операторов исходного кода в коды операций."""
    return {
        "<": Opcode.LEFT,
        ">": Opcode.RIGHT,
        "+": Opcode.INC,
        "-": Opcode.DEC,
        ",": Opcode.INPUT,
        ".": Opcode.PRINT,
    }.get(symbol)


def text2terms(text):
    """Трансляция текста в последовательность операторов языка (токенов).

    Включает в себя:

    - отсеивание всех незначимых символов (считаются комментариями);
    - проверка формальной корректности программы (парность оператора цикла).
    """
    terms = []
    for line_num, line in enumerate(text.split(), 1):
        for pos, char in enumerate(line, 1):
            if char in symbols():
                terms.append(Term(line_num, pos, char))

    deep = 0
    for term in terms:
        if term.symbol == "[":
            deep += 1
        if term.symbol == "]":
            deep -= 1
        assert deep >= 0, "Unbalanced brackets!"
    assert deep == 0, "Unbalanced brackets!"

    return terms


def translate(text):
    """Трансляция текста программы в машинный код.

    Выполняется в два этапа:

    1. Трансляция текста в последовательность операторов языка (токенов).

    2. Генерация машинного кода.

        - Прямое отображение части операторов в машинный код.

        - Отображение операторов цикла в инструкции перехода с учётом
    вложенности и адресации инструкций. Подробнее см. в документации к
    `isa.Opcode`.

    """
    terms = text2terms(text)

    # Транслируем термы в машинный код.
    code = []
    jmp_stack = []
    for pc, term in enumerate(terms):
        if term.symbol == "[":
            # оставляем placeholder, который будет заменён в конце цикла
            code.append(None)
            jmp_stack.append(pc)
        elif term.symbol == "]":
            # формируем цикл с началом из jmp_stack
            begin_pc = jmp_stack.pop()
            begin = {"index": pc, "opcode": Opcode.JZ, "arg": pc + 1, "term": terms[begin_pc]}
            end = {"index": pc, "opcode": Opcode.JMP, "arg": begin_pc, "term": term}
            code[begin_pc] = begin
            code.append(end)
        else:
            # Обработка тривиально отображаемых операций.
            code.append({"index": pc, "opcode": symbol2opcode(term.symbol), "term": term})

    # Добавляем инструкцию остановки процессора в конец программы.
    code.append({"index": len(code), "opcode": Opcode.HALT})
    return code


def main(source, target):
    """Функция запуска транслятора. Параметры -- исходный и целевой файлы."""
    with open(source, encoding="utf-8") as f:
        source = f.read()

    code = translate(source)

    write_code(target, code)
    print("source LoC:", len(source.split("\n")), "code instr:", len(code))


if __name__ == "__main__":
    assert len(sys.argv) == 3, "Wrong arguments: translator.py <input_file> <target_file>"
    _, source, target = sys.argv
    main(source, target)
