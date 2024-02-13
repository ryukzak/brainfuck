#!/usr/bin/python3
"""Транслятор Asm в машинный код.
"""

import re
import sys

from isa import Opcode, Term, write_code


def translate(text):
    """Трансляция текста программы на Asm в машинный код.

    Выполняется в два этапа:

    1. Разбор текста на метки и инструкции.

    2. Подстановка адресов меток в инструкции.
    """
    labels, code = parse(text)

    for instr in code:
        if "arg" in instr:
            # у инструкции есть аргумент, и этот аргумент - строка (название метки)
            label = instr["arg"]
            assert label in labels, "Undefined label: {}".format(label)
            # подставляем адрес
            instr["arg"] = labels[label]

    return code


def parse(text):
    """Разбор текста на словарь с определением меток и список машинных инструкций."""
    pc = 0
    labels = {}
    code = []

    for line_num, raw_line in enumerate(text.splitlines(), 1):
        line = remove_comment(raw_line)

        line, label = parse_label(line)
        if label is not None:
            assert label not in labels, "Redefinition of label: {}".format(label)
            # адрес метки - адрес следующей инструкции
            labels[label] = pc

        if not line:
            # на строке нет инструкции
            continue

        # вычисляем номер столбца, с которого начинается инструкция
        col = raw_line.find(line) + 1
        term = Term(line_num, col, line)

        instr = parse_instr(line, pc, term)
        code.append(instr)
        pc += 1

    return labels, code


def remove_comment(line):
    """Удаляет комментарий, начинающийся с `;` из строки."""
    return line.split(";", 1)[0].strip()


def is_valid_label_name(name):
    """Проверяет название метки на корректность синтаксиса."""
    return re.match(r"^[a-zA-Z_][a-zA-Z0-9_]*$", name)


def parse_label(line):
    """Достает из строки метку, если она присутствует, и проверяет ее на корректность.

    Возвращает остаток строки и название метки (или `None`, если метки нет)"""
    parts = line.split(":", 1)
    if len(parts) == 1:
        return line, None

    label = parts[0].strip()
    rest = parts[1].strip()

    assert is_valid_label_name(label), "Invalid label name: {}".format(label)

    return rest, label


def parse_instr(line, index, term):
    """Разбирает инструкцию из строки. Конвертирует мнемонику в опкод, а аргумент - в число."""
    parts = line.split(None)

    mnemonic = parts[0]
    opcode = Opcode(mnemonic)

    arg = parts[1] if len(parts) > 1 else None
    if arg is not None:
        assert opcode == Opcode.JZ or opcode == Opcode.JMP, "Only `jz` and `jnz` instructions take an argument"
        assert len(parts) == 2, "Trailing characters"
        assert is_valid_label_name(arg), "Invalid label name: {}".format(arg)

        # порядок полей такой же, как в трансляторе brainfuck
        return {"index": index, "opcode": opcode, "arg": arg, "term": term}

    return {"index": index, "opcode": opcode, "term": term}


def main(source, target):
    """Функция запуска транслятора. Параметры -- исходный и целевой файлы."""
    with open(source, encoding="utf-8") as f:
        source = f.read()

    code = translate(source)

    write_code(target, code)
    print("source LoC:", len(source.split("\n")), "code instr:", len(code))


if __name__ == "__main__":
    assert len(sys.argv) == 3, "Wrong arguments: translator_asm.py <input_file> <target_file>"
    _, source, target = sys.argv
    main(source, target)
