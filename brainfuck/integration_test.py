"""Интеграционные тесты транслятора и машины.

В данном модуле использованы два подхода для тестирования:

- golden tests (`test_whole_by_golden`) -- легковесные и удобные (рекомендуется
  для выполнения задачи)

- традиционные тесты (`TestWhole`) -- тяжеловесные и не удобные (не требуются
  для выполнения задачи)

- дополнительно рекомендуется делать unit-тесты для отдельных функций, где это
целесообразно
"""

import contextlib
import io
import logging
import os
import tempfile
import unittest

import machine
import pytest
import translator


@pytest.mark.golden_test("golden/*.yml")
def test_whole_by_golden(golden, caplog):
    """Используется подход golden tests. У него не самая удачная реализация для
    python: https://pypi.org/project/pytest-golden/ , но знать об этом подходе
    крайне полезно.

    Принцип работы следующий: во внешних файлах специфицируются входные и
    выходные данные для теста. При запуске тестов происходит сравнение и если
    выход изменился -- выводится ошибка.

    Если вы меняете логику работы приложения -- то запускаете тесты с ключом:
    `cd src/brainfuck && pytest . -v --update-goldens`

    Это обновит файлы конфигурации, и вы можете закоммитить изменения в
    репозиторий, если они корректные.

    Формат файла описания теста -- YAML. Поля определяются доступом из теста к
    аргументу `golden` (`golden[key]` -- входные данные, `golden.out("key")` --
    выходные данные).

    Вход:

    - `in_source` -- исходный код
    - `in_stdin` -- данные на ввод процессора для симуляции

    Выход:

    - `out_code` -- машинный код, сгенерированный транслятором
    - `out_stdout` -- стандартный вывод транслятора и симулятора
    - `out_log` -- журнал программы
    """
    # Установим уровень отладочного вывода на DEBUG
    caplog.set_level(logging.DEBUG)

    # Создаём временную папку для тестирования приложения.
    with tempfile.TemporaryDirectory() as tmpdirname:
        # Готовим имена файлов для входных и выходных данных.
        source = os.path.join(tmpdirname, "source.bf")
        input_stream = os.path.join(tmpdirname, "input.txt")
        target = os.path.join(tmpdirname, "target.o")

        # Записываем входные данные в файлы. Данные берутся из теста.
        with open(source, "w", encoding="utf-8") as file:
            file.write(golden["in_source"])
        with open(input_stream, "w", encoding="utf-8") as file:
            file.write(golden["in_stdin"])

        # Запускаем транслятор и собираем весь стандартный вывод в переменную
        # stdout
        with contextlib.redirect_stdout(io.StringIO()) as stdout:
            translator.main(source, target)
            print("============================================================")
            machine.main(target, input_stream)

        # Выходные данные также считываем в переменные.
        with open(target, encoding="utf-8") as file:
            code = file.read()

        # Проверяем, что ожидания соответствуют реальности.
        assert code == golden.out["out_code"]
        assert stdout.getvalue() == golden.out["out_stdout"]
        assert caplog.text == golden.out["out_log"]


class TestWhole(unittest.TestCase):
    """Данные тесты оставлены для общего развития. Для выполнения лабораторной
    работы они не требуются.

    В задании лабораторной работы необходимо использовать golden tests.
    """

    def test_hello(self):
        # Создаём временную папку для скомпилированного файла. Удаляется автоматически.
        with tempfile.TemporaryDirectory() as tmpdirname:
            source = "examples/hello.bf"
            target = os.path.join(tmpdirname, "machine_code.out")
            input_stream = "examples/input.txt"

            # Собираем весь стандартный вывод в переменную stdout.
            with contextlib.redirect_stdout(io.StringIO()) as stdout:
                translator.main(source, target)
                machine.main(target, input_stream)

            # Проверяем, что было напечатано то, что мы ожидали.
            assert (
                stdout.getvalue()
                == "source LoC: 357 code instr: 131\nHello World!\n\ninstr_counter:  987 ticks: 1532\n"
            )

    def test_cat(self):
        with tempfile.TemporaryDirectory() as tmpdirname:
            source = "examples/cat.bf"
            target = os.path.join(tmpdirname, "machine_code.out")
            input_stream = "examples/input.txt"

            with contextlib.redirect_stdout(io.StringIO()) as stdout:
                # Собираем журнал событий по уровню INFO в переменную logs.
                with self.assertLogs("", level="INFO") as logs:
                    translator.main(source, target)
                    machine.main(target, input_stream)

            assert (
                stdout.getvalue()
                == "source LoC: 1 code instr: 6\nHello World from input!\n\ninstr_counter:  95 ticks: 168\n"
            )

            assert logs.output == [
                "WARNING:root:Input buffer is empty!",
                "INFO:root:output_buffer: 'Hello World from input!\\n'",
            ]

    def test_cat_trace(self):
        with tempfile.TemporaryDirectory() as tmpdirname:
            source = "examples/cat.bf"
            target = os.path.join(tmpdirname, "machine_code.out")
            input_stream = "examples/foo_input.txt"

            with contextlib.redirect_stdout(io.StringIO()) as stdout:
                with self.assertLogs("", level="DEBUG") as logs:
                    translator.main(source, target)
                    machine.main(target, input_stream)

            assert stdout.getvalue() == "source LoC: 1 code instr: 6\nfoo\n\ninstr_counter:  15 ticks: 28\n"

            expect_log = [
                "DEBUG:root:{TICK: 0, PC: 0, ADDR: 0, OUT: 0, ACC: 0} input  (',' @ 1:1)",
                "DEBUG:root:input: 'f'",
                "DEBUG:root:{TICK: 2, PC: 1, ADDR: 0, OUT: 102, ACC: 0} jz 5 ('[' @ 1:2)",
                "DEBUG:root:{TICK: 4, PC: 2, ADDR: 0, OUT: 102, ACC: 102} print  ('.' @ 1:3)",
                "DEBUG:root:output: '' << 'f'",
                "DEBUG:root:{TICK: 6, PC: 3, ADDR: 0, OUT: 102, ACC: 102} input  (',' @ 1:4)",
                "DEBUG:root:input: 'o'",
                "DEBUG:root:{TICK: 8, PC: 4, ADDR: 0, OUT: 111, ACC: 102} jmp 1 (']' @ 1:5)",
                "DEBUG:root:{TICK: 9, PC: 1, ADDR: 0, OUT: 111, ACC: 102} jz 5 ('[' @ 1:2)",
                "DEBUG:root:{TICK: 11, PC: 2, ADDR: 0, OUT: 111, ACC: 111} print  ('.' @ 1:3)",
                "DEBUG:root:output: 'f' << 'o'",
                "DEBUG:root:{TICK: 13, PC: 3, ADDR: 0, OUT: 111, ACC: 111} input  (',' @ 1:4)",
                "DEBUG:root:input: 'o'",
                "DEBUG:root:{TICK: 15, PC: 4, ADDR: 0, OUT: 111, ACC: 111} jmp 1 (']' @ 1:5)",
                "DEBUG:root:{TICK: 16, PC: 1, ADDR: 0, OUT: 111, ACC: 111} jz 5 ('[' @ 1:2)",
                "DEBUG:root:{TICK: 18, PC: 2, ADDR: 0, OUT: 111, ACC: 111} print  ('.' @ 1:3)",
                "DEBUG:root:output: 'fo' << 'o'",
                "DEBUG:root:{TICK: 20, PC: 3, ADDR: 0, OUT: 111, ACC: 111} input  (',' @ 1:4)",
                "DEBUG:root:input: '\\n'",
                "DEBUG:root:{TICK: 22, PC: 4, ADDR: 0, OUT: 10, ACC: 111} jmp 1 (']' @ 1:5)",
                "DEBUG:root:{TICK: 23, PC: 1, ADDR: 0, OUT: 10, ACC: 111} jz 5 ('[' @ 1:2)",
                "DEBUG:root:{TICK: 25, PC: 2, ADDR: 0, OUT: 10, ACC: 10} print  ('.' @ 1:3)",
                "DEBUG:root:output: 'foo' << '\\n'",
                "DEBUG:root:{TICK: 27, PC: 3, ADDR: 0, OUT: 10, ACC: 10} input  (',' @ 1:4)",
                "WARNING:root:Input buffer is empty!",
                "INFO:root:output_buffer: 'foo\\n'",
            ]
            assert logs.output == expect_log
