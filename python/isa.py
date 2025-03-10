"""Представление исходного и машинного кода.

Особенности реализации:

- Машинный код сериализуется в список JSON. Один элемент списка -- одна инструкция.
- Индекс списка соответствует:
     - адресу оператора в исходном коде;
     - адресу инструкции в машинном коде.

Пример:

```json
[
    {
        "index": 0,
        "opcode": "jz",
        "arg": 5,
        "term": [
            1,
            5,
            "]"
        ]
    },
]
```

где:

- `index` -- номер в машинном коде, необходим для того, чтобы понимать, куда делается условный переход;
- `opcode` -- строка с кодом операции (тип: `Opcode`);
- `arg` -- аргумент инструкции (если требуется);
- `term` -- информация о связанном месте в исходном коде (если есть).
"""

import json
from collections import namedtuple
from enum import Enum


class Opcode(str, Enum):
    """Opcode для инструкций.

    Можно разделить на две группы:

    1. Непосредственно представленные на уровне языка: `RIGHT`, `LEFT`, `INC`, `DEC`, `INPUT`, `PRINT`.
    2. Инструкции для управления, где:
        - `JMP`, `JZ` -- безусловный и условный переходы:

            | Operator Position | Исходный код | Машинный код |
            |-------------------|--------------|--------------|
            | n                 | `[`          | `JZ (k+1)`   |
            | ...               | ...          |              |
            | k                 |              |              |
            | k+1               | `]`          | `JMP n`      |

        - `HALT` -- остановка машины.
    """

    RIGHT = "right"
    LEFT = "left"
    INC = "increment"
    DEC = "decrement"
    INPUT = "input"
    PRINT = "print"

    JMP = "jmp"
    JZ = "jz"

    HALT = "halt"

    def __str__(self):
        """Переопределение стандартного поведения `__str__` для `Enum`: вместо
        `Opcode.INC` вернуть `increment`.
        """
        return str(self.value)


class Term(namedtuple("Term", "line pos symbol")):
    """Описание выражения из исходного текста программы.

    Сделано через класс, чтобы был docstring.
    """


def write_code(filename, code):
    """Записать машинный код в файл."""
    with open(filename, "w", encoding="utf-8") as file:
        # Почему не: `file.write(json.dumps(code, indent=4))`?
        # Чтобы одна инструкция была на одну строку.
        buf = []
        for instr in code:
            buf.append(json.dumps(instr))
        file.write("[" + ",\n ".join(buf) + "]")


def read_code(filename):
    """Прочесть машинный код из файла.

    Так как в файле хранятся не только простейшие типы (`Opcode`, `Term`), мы
    также выполняем конвертацию в объекты классов вручную (возможно, следует
    переписать через `JSONDecoder`, но это скорее усложнит код).

    """
    with open(filename, encoding="utf-8") as file:
        code = json.loads(file.read())

    for instr in code:
        # Конвертация строки в Opcode
        instr["opcode"] = Opcode(instr["opcode"])

        # Конвертация списка term в класс Term
        if "term" in instr:
            assert len(instr["term"]) == 3
            instr["term"] = Term(instr["term"][0], instr["term"][1], instr["term"][2])

    return code


# Словарь соответствия кодов операций их бинарному представлению
opcode_to_binary = {
    Opcode.INC: 0x0,  # 0000
    Opcode.DEC: 0x1,  # 0001
    Opcode.LEFT: 0x2,  # 0010
    Opcode.RIGHT: 0x3,  # 0011
    Opcode.PRINT: 0x4,  # 0100
    Opcode.INPUT: 0x5,  # 0101
    Opcode.JMP: 0x6,  # 0110
    Opcode.JZ: 0x7,  # 0111
    Opcode.HALT: 0x8,  # 1000
}

binary_to_opcode = {
    0x0: Opcode.INC,  # 0000
    0x1: Opcode.DEC,  # 0001
    0x2: Opcode.LEFT,  # 0010
    0x3: Opcode.RIGHT,  # 0011
    0x4: Opcode.PRINT,  # 0100
    0x5: Opcode.INPUT,  # 0101
    0x6: Opcode.JMP,  # 0110
    0x7: Opcode.JZ,  # 0111
    0x8: Opcode.HALT,  # 1000
}


def to_binary(code):
    """Преобразует машинный код в бинарное представление.

    Бинарное представление инструкций:
    ┌─────────┬─────────────────────────────────────────────────────────────┐
    │ 31...28 │ 27                                                        0 │
    ├─────────┼─────────────────────────────────────────────────────────────┤
    │  опкод  │                      адрес перехода                         │
    └─────────┴─────────────────────────────────────────────────────────────┘
    """
    binary_bytes = bytearray()
    for instr in code:
        # Получаем бинарный код операции
        opcode_bin = opcode_to_binary[instr["opcode"]] << 28

        # Добавляем адрес перехода, если он есть
        arg = instr.get("arg", 0)

        # Формируем 32-битное слово: опкод (4 бита) + адрес (28 бит)
        binary_instr = opcode_bin | (arg & 0x0FFFFFFF)

        # Преобразуем 32-битное целое число в 4 байта (big-endian)
        binary_bytes.extend(
            ((binary_instr >> 24) & 0xFF, (binary_instr >> 16) & 0xFF, (binary_instr >> 8) & 0xFF, binary_instr & 0xFF)
        )

    return bytes(binary_bytes)


def to_hex(code):
    """Преобразует машинный код в текстовый файл с шестнадцатеричным представлением.

    Формат вывода:
    <address> - <HEXCODE> - <mnemonic>
    Например:
    20 - 03340301 - add #01 <- 34 + #03
    """
    binary_code = to_binary(code)
    result = []

    for i in range(0, len(binary_code), 4):
        if i + 3 >= len(binary_code):
            break

        # Формируем 32-битное слово из 4 байтов
        word = (binary_code[i] << 24) | (binary_code[i + 1] << 16) | (binary_code[i + 2] << 8) | binary_code[i + 3]

        # Получаем опкод и адрес
        opcode_bin = (word >> 28) & 0xF
        arg = word & 0x0FFFFFFF

        # Преобразуем опкод и адрес в мнемонику
        mnemonic = binary_to_opcode[opcode_bin].value
        if opcode_bin in (0x6, 0x7):  # jmp или jz требуют аргумент
            mnemonic = f"{mnemonic} {arg}"

        # Формируем строку в требуемом формате
        hex_word = f"{word:08X}"
        address = i // 4
        line = f"{address} - {hex_word} - {mnemonic}"
        result.append(line)

    return "\n".join(result)


def from_binary(binary_code):
    """Преобразует бинарное представление машинного кода в структурированный формат.

    Бинарное представление инструкций:
    ┌─────────┬─────────────────────────────────────────────────────────────┐
    │ 31...28 │ 27                                                        0 │
    ├─────────┼─────────────────────────────────────────────────────────────┤
    │  опкод  │                      адрес перехода                         │
    └─────────┴─────────────────────────────────────────────────────────────┘
    """
    # Словарь соответствия бинарного представления кодам операций
    binary_to_opcode = {
        0x0: Opcode.INC,  # 0000
        0x1: Opcode.DEC,  # 0001
        0x2: Opcode.LEFT,  # 0010
        0x3: Opcode.RIGHT,  # 0011
        0x4: Opcode.PRINT,  # 0100
        0x5: Opcode.INPUT,  # 0101
        0x6: Opcode.JMP,  # 0110
        0x7: Opcode.JZ,  # 0111
        0x8: Opcode.HALT,  # 1000
    }

    structured_code = []
    for i, binary_instr in enumerate(binary_code):
        # Извлекаем опкод (старшие 4 бита)
        opcode_bin = (binary_instr >> 28) & 0xF
        opcode = binary_to_opcode[opcode_bin]

        # Извлекаем адрес перехода (младшие 28 бит)
        arg = binary_instr & 0x0FFFFFFF

        # Формируем структуру инструкции
        instr = {"index": i, "opcode": opcode}

        # Добавляем адрес перехода только для инструкций перехода
        if opcode in (Opcode.JMP, Opcode.JZ):
            instr["arg"] = arg

        structured_code.append(instr)

    return structured_code
