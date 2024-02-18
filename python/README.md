# Brainfuck. Транслятор и модель

- Преподаватели, Пенской Александр Владимирович.
- `bf_lang -> bf_asm | bf_isa | harv | hw | instr | struct | stream | port | - | - | -`
- Базовый вариант.

Примечания:

- Данный проект имеет избыточное количество комментариев (к примеру, схемы продублированы в исходном коде для удобства читателя).
    - Более того, такое количество комментариев затруднит проверку вашей работы.
- Данный проект предпочитает простоту элегантности, так как является учебным примером. Там, где можно написать без синтаксического сахара -- написано без него.
- MR приветствуются, но должны учитывать вышесказанное.
- Данный проект не является обязательным шаблоном, и вы можете использовать другую структуру проекта. При этом нагромождения модулей и классов следует избегать. Будьте проще.
- Данный проект не может претендовать на высший балл, т.к.:
    - только интеграционные тесты;
    - проигнорированы важные возможности python 3.6+ (типизация);
    - простой вариант без усложнений;
    - плохой CLI (всё прибито гвоздями, нет помощи, нет управления уровнем журналов);
    - как минимум одна глупость в работе ControlUnit (умышленно сохранена).
- Указанный выше вариант -- вымышленный.
- Задание на лабораторную работу: [lab3-task.md](/lab3-task.md).

## Язык программирования

``` ebnf
program ::= term

term ::= symbol
       | comment
       | term term
       | "[" term "]"

symbol ::= ">" | "<" | "+" | "-" | "." | ","

comment ::= <any symbols except: "><+-.,[]">
```

Код выполняется последовательно. Операции:

- `+` -- увеличить значение в текущей ячейке на 1
- `-` -- уменьшить значение в текущей ячейке на 1
- `>` -- перейти к следующей ячейке
- `<` -- перейти к предыдущей ячейке
- `.` -- напечатать значение из текущей ячейки (символ)
- `,` -- ввести извне значение и сохранить в текущей ячейке (символ)
- `[` -- если значение текущей ячейки ноль, перейти вперёд по тексту программы на символ, следующий за соответствующей `]` (с учётом вложенности)
- `]` -- если значение текущей ячейки не ноль, перейти назад по тексту программы на символ `[` (с учётом вложенности)

Любые другие символы трактуются как комментарии.

Память выделяется статически, при запуске модели. Видимость данных -- глобальная. Поддержка литералов -- отсутствует.

## Язык программирования Asm

Альтернативный вариант, реализующий язык программирования Asm вместо Brainfuck см. в файле [./README_asm.md](./README_asm.md).

## Организация памяти

Модель памяти процессора (приведено списком, так как тривиальна):

1. Память команд. Машинное слово -- не определено. Реализуется списком словарей, описывающих инструкции (одно слово -- одна ячейка).
2. Память данных. Машинное слово -- 8 бит, знаковое. Линейное адресное пространство. Реализуется списком чисел.

В связи с отсутствием на уровне языка переменных, констант, литералов и т.д., описание механизмов работы с ними -- отсутствует. Содержание раздела -- смотри в задании.

## Система команд

Особенности процессора:

- Машинное слово -- 8 бит, знаковое.
- Доступ к памяти данных осуществляется по адресу, хранящемуся в специальном регистре `data_address`. Установка адреса осуществляется путём инкрементирования или декрементирования инструкциями `<` и `>`.
- Обработка данных осуществляется по текущему адресу операциями `+` и `-`, а также через ввод/вывод.
- Поток управления:
    - инкремент `PC` после каждой инструкции;
    - условный (`jz`) и безусловный (`jmp`) переходы (использование см. в разделе транслятор).

### Набор инструкций

| Язык | Инструкция   | Кол-во тактов | Описание                                                    |
|:-----|:-------------|:--------------|:------------------------------------------------------------|
| `+`  | increment    | 2             | увеличить значение в текущей ячейке на 1                    |
| `-`  | decrement    | 2             | уменьшить значение в текущей ячейке на 1                    |
| `<`  | left         | 1             | перейти к следующей ячейке                                  |
| `>`  | right        | 1             | перейти к предыдущей ячейке                                 |
| `.`  | print        | 2             | напечатать значение из текущей ячейки (символ)              |
| `,`  | input        | 2             | ввести извне значение и сохранить в текущей ячейке (символ) |
|      | jmp `<addr>` | 1             | безусловный переход                                         |
|      | jz `<addr>`  | 2             | переход, если в текущей ячейке 0                            |
|      | halt         | 0             | остановка                                                   |

- `<addr>` -- исключительно непосредственная адресация памяти команд.

### Кодирование инструкций

- Машинный код сериализуется в список JSON.
- Один элемент списка -- одна инструкция.
- Индекс списка -- адрес инструкции. Используется для команд перехода.

Пример:

```json
[
    {
        "opcode": "jz",
        "arg": 5,
        "term": [
            1,
            5,
            "]"
        ]
    }
]
```

где:

- `opcode` -- строка с кодом операции;
- `arg` -- аргумент (может отсутствовать);
- `term` -- информация о связанном месте в исходном коде (если есть).

Типы данных в модуле [isa](./isa.py), где:

- `Opcode` -- перечисление кодов операций;
- `Term` -- структура для описания значимого фрагмента кода исходной программы.

## Транслятор

Интерфейс командной строки: `translator.py <input_file> <target_file>`

Реализовано в модуле: [translator](./translator.py)

Этапы трансляции (функция `translate`):

1. Трансформирование текста в последовательность значимых термов.
2. Проверка корректности программы (парность квадратных скобок).
3. Генерация машинного кода.

Правила генерации машинного кода:

- один символ языка -- одна инструкция;
- для команд, однозначно соответствующих инструкциям, -- прямое отображение;
- для циклов с соблюдением парности (многоточие -- произвольный код):

    | Номер команды/инструкции | Программа | Машинный код |
    |:-------------------------|:----------|:-------------|
    | n                        | `[`       | `JZ (k+1)`   |
    | ...                      | ...       | ...          |
    | k                        | `]`       | `JMP n`      |
    | k+1                      | ...       | ...          |

Примечание: вопросы отображения переменных на регистры опущены из-за отсутствия оных.

## Модель процессора

Интерфейс командной строки: `machine.py <machine_code_file> <input_file>`

Реализовано в модуле: [machine](./machine.py).

### DataPath

``` text
     latch --------->+--------------+  addr   +--------+
     data            | data_address |---+---->|  data  |
     addr      +---->+--------------+   |     | memory |
               |                        |     |        |
           +-------+                    |     |        |
    sel -->|  MUX  |         +----------+     |        |
           +-------+         |                |        |
            ^     ^          |                |        |
            |     |          |       data_in  |        | data_out
            |     +---(+1)---+          +---->|        |-----+
            |                |          |     |        |     |
            +---------(-1)---+          |  oe |        |     |
                                        | --->|        |     |
                                        |     |        |     |
                                        |  wr |        |     |
                                        | --->|        |     |
                                        |     +--------+     |
                                        |                    v
                                    +--------+  latch_acc +-----+
                          sel ----> |  MUX   |  --------->| acc |
                                    +--------+            +-----+
                                     ^   ^  ^                |
                                     |   |  |                +---(==0)---> zero
                                     |   |  |                |
                                     |   |  +---(+1)---------+
                                     |   |                   |
                                     |   +------(-1)---------+
                                     |                       |
            input -------------------+                       +---------> output
```

Реализован в классе `DataPath`.

`data_memory` -- однопортовая память, поэтому либо читаем, либо пишем.

Сигналы (обрабатываются за один такт, реализованы в виде методов класса):

- `latch_data_addr` -- защёлкнуть выбранное значение в `data_addr`;
- `latch_acc` -- защёлкнуть в аккумулятор выход памяти данных;
- `wr` -- записать выбранное значение в память:
    - инкрементированное;
    - декрементированное;
    - с порта ввода `input` (обработка на Python):
        - извлечь из входного буфера значение и записать в память;
        - если буфер пуст -- выбросить исключение;
- `output` -- записать аккумулятор в порт вывода (обработка на Python).

Флаги:

- `zero` -- отражает наличие нулевого значения в аккумуляторе.

### ControlUnit

``` text
   +------------------(+1)-------+
   |                             |
   |    latch_program_counter    |
   |                  |          |
   |   +-----+        v          |
   +-->|     |     +---------+   |    +---------+
       | MUX |---->| program |---+--->| program |
   +-->|     |     | counter |        | memory  |
   |   +-----+     +---------+        +---------+
   |      ^                               |
   |      | sel_next                      | current instruction
   |      |                               |
   +---------------(select-arg)-----------+
          |                               |      +---------+
          |                               |      |  step   |
          |                               |  +---| counter |
          |                               |  |   +---------+
          |                               v  v        ^
          |                       +-------------+     |
          +-----------------------| instruction |-----+
                                  |   decoder   |
                                  |             |<-------+
                                  +-------------+        |
                                          |              |
                                          | signals      |
                                          v              |
                                    +----------+  zero   |
                                    |          |---------+
                                    | DataPath |
                     input -------->|          |----------> output
                                    +----------+
```

Реализован в классе `ControlUnit`.

- Hardwired (реализовано полностью на Python).
- Метод `decode_and_execute_instruction` моделирует выполнение полного цикла инструкции (1-2 такта процессора).
- `step_counter` необходим для многотактовых инструкций;
    - в реализации класс `ControlUnit` отсутствует, т.к. неявно задан потоком управления.

Сигнал:

- `latch_program_counter` -- сигнал для обновления счётчика команд в ControlUnit.

Особенности работы модели:

- Цикл симуляции осуществляется в функции `simulation`.
- Шаг моделирования соответствует одной инструкции с выводом состояния в журнал.
- Для журнала состояний процессора используется стандартный модуль `logging`.
- Количество инструкций для моделирования лимитировано.
- Остановка моделирования осуществляется при:
    - превышении лимита количества выполняемых инструкций;
    - исключении `EOFError` -- если нет данных для чтения из порта ввода;
    - исключении `StopIteration` -- если выполнена инструкция `halt`.

## Тестирование

Тестирование выполняется при помощи golden test-ов.

1. Тесты для языка `bf` реализованы в: [golden_bf_test.py](./golden_bf_test.py). Конфигурации:
    - [golden/cat_bf.yml](golden/cat_bf.yml)
    - [golden/hello_bf.yml](golden/hello_bf.yml)
1. Тесты для языка `asm` реализованы в: [golden_asm_test.py](./golden_asm_test.py). Конфигурации:
    - [golden/cat_asm.yml](golden/cat_asm.yml)
1. Традиционные интеграционные тесты: [integration_test.py](./integration_test.py) (Depricated).

Запустить тесты: `poetry run pytest . -v`

Обновить конфигурацию golden tests:  `poetry run pytest . -v --update-goldens`

CI при помощи Github Action:

``` yaml
defaults:
  run:
    working-directory: ./python

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: 3.11

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install poetry
          poetry install

      - name: Run tests and collect coverage
        run: |
          poetry run coverage run -m pytest .
          poetry run coverage report -m
        env:
          CI: true

  lint:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: 3.11

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install poetry
          poetry install

      - name: Check code formatting with Ruff
        run: poetry run ruff format --check .

      - name: Run Ruff linters
        run: poetry run ruff check .
```

где:

- `poetry` -- управления зависимостями для языка программирования Python.
- `coverage` -- формирование отчёта об уровне покрытия исходного кода.
- `pytest` -- утилита для запуска тестов.
- `ruff` -- утилита для форматирования и проверки стиля кодирования.

Пример использования и журнал работы процессора на примере `cat`:

``` shell
$ cd src/brainfuck
$ cat examples/foo_input.txt
foo
$ cat examples/cat.bf
,[.,]
$ ./translator.py examples/cat.bf target.out
source LoC: 1 code instr: 6
$ cat target.out
[{"index": 0, "opcode": "input", "term": [1, 1, ","]},
 {"index": 4, "opcode": "jz", "arg": 5, "term": [1, 2, "["]},
 {"index": 2, "opcode": "print", "term": [1, 3, "."]},
 {"index": 3, "opcode": "input", "term": [1, 4, ","]},
 {"index": 4, "opcode": "jmp", "arg": 1, "term": [1, 5, "]"]},
 {"opcode": "halt"}]⏎
$ ./machine.py target.out examples/foo_input.txt
DEBUG:root:TICK:   0 PC:   0 ADDR:   0 MEM_OUT: 0 ACC: 0  input  (','@1:1)
DEBUG:root:input: 'f'
DEBUG:root:TICK:   2 PC:   1 ADDR:   0 MEM_OUT: 102 ACC: 0  jz 5  ('['@1:2)
DEBUG:root:TICK:   4 PC:   2 ADDR:   0 MEM_OUT: 102 ACC: 102  print  ('.'@1:3)
DEBUG:root:output: '' << 'f'
DEBUG:root:TICK:   6 PC:   3 ADDR:   0 MEM_OUT: 102 ACC: 102  input  (','@1:4)
DEBUG:root:input: 'o'
DEBUG:root:TICK:   8 PC:   4 ADDR:   0 MEM_OUT: 111 ACC: 102  jmp 1  (']'@1:5)
DEBUG:root:TICK:   9 PC:   1 ADDR:   0 MEM_OUT: 111 ACC: 102  jz 5  ('['@1:2)
DEBUG:root:TICK:  11 PC:   2 ADDR:   0 MEM_OUT: 111 ACC: 111  print  ('.'@1:3)
DEBUG:root:output: 'f' << 'o'
DEBUG:root:TICK:  13 PC:   3 ADDR:   0 MEM_OUT: 111 ACC: 111  input  (','@1:4)
DEBUG:root:input: 'o'
DEBUG:root:TICK:  15 PC:   4 ADDR:   0 MEM_OUT: 111 ACC: 111  jmp 1  (']'@1:5)
DEBUG:root:TICK:  16 PC:   1 ADDR:   0 MEM_OUT: 111 ACC: 111  jz 5  ('['@1:2)
DEBUG:root:TICK:  18 PC:   2 ADDR:   0 MEM_OUT: 111 ACC: 111  print  ('.'@1:3)
DEBUG:root:output: 'fo' << 'o'
DEBUG:root:TICK:  20 PC:   3 ADDR:   0 MEM_OUT: 111 ACC: 111  input  (','@1:4)
DEBUG:root:input: '\n'
DEBUG:root:TICK:  22 PC:   4 ADDR:   0 MEM_OUT: 10 ACC: 111  jmp 1  (']'@1:5)
DEBUG:root:TICK:  23 PC:   1 ADDR:   0 MEM_OUT: 10 ACC: 111  jz 5  ('['@1:2)
DEBUG:root:TICK:  25 PC:   2 ADDR:   0 MEM_OUT: 10 ACC: 10  print  ('.'@1:3)
DEBUG:root:output: 'foo' << '\n'
DEBUG:root:TICK:  27 PC:   3 ADDR:   0 MEM_OUT: 10 ACC: 10  input  (','@1:4)
WARNING:root:Input buffer is empty!
INFO:root:output_buffer: 'foo\n'
```

Пример проверки исходного кода:

``` shell
$ poetry run pytest . -v
=================================== test session starts ====================================
platform darwin -- Python 3.12.0, pytest-7.4.3, pluggy-1.3.0 -- /Users/ryukzak/Library/Caches/pypoetry/virtualenvs/brainfuck-NIOcuFng-py3.12/bin/python
cachedir: .pytest_cache
rootdir: /Users/ryukzak/edu/csa/src/brainfuck
configfile: pyproject.toml
plugins: golden-0.2.2
collected 6 items

integration_test.py::test_translator_and_machine[golden/cat.yml] PASSED              [ 16%]
integration_test.py::test_translator_and_machine[golden/hello.yml] PASSED            [ 33%]
integration_test.py::TestTranslatorAndMachine::test_cat_example PASSED               [ 50%]
integration_test.py::TestTranslatorAndMachine::test_cat_example_log PASSED           [ 66%]
integration_test.py::TestTranslatorAndMachine::test_hello_example PASSED             [ 83%]
machine.py::machine.DataPath.signal_wr PASSED                                        [100%]

==================================== 6 passed in 0.14s =====================================
$ poetry run ruff check .
$ poetry run ruff format .
4 files left unchanged
```

```text
| ФИО                            | алг   | LoC | code байт | code инстр. | инстр. | такт. | вариант |
| Пенской Александр Владимирович | hello | ... | -         | ...         | ...    | ...   | ...     |
| Пенской Александр Владимирович | cat   | 1   | -         | 6           | 15     | 28    | ...     |
```
