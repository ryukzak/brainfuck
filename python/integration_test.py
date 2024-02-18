"""Интеграционные тесты транслятора и машины. Depricated.

Данные тесты тяжеловесные и не удобные (не требуются для выполнения задания).
"""

import contextlib
import io
import os
import tempfile
import unittest

import machine
import translator


class TestTranslatorAndMachine(unittest.TestCase):
    """Данные тесты оставлены для общего развития. Для выполнения лабораторной
    работы они не требуются.

    В задании лабораторной работы необходимо использовать golden tests.
    """

    def test_hello_example(self):
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
                stdout.getvalue() == "source LoC: 44 code instr: 131\nHello World!\n\ninstr_counter:  987 ticks: 1532\n"
            )

    def test_cat_example(self):
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
                == "source LoC: 2 code instr: 6\nHello World from input!\n\ninstr_counter:  95 ticks: 168\n"
            )

            assert logs.output == [
                "WARNING:root:Input buffer is empty!",
                "INFO:root:output_buffer: 'Hello World from input!\\n'",
            ]

    def test_cat_example_log(self):
        with tempfile.TemporaryDirectory() as tmpdirname:
            source = "examples/cat.bf"
            target = os.path.join(tmpdirname, "machine_code.out")
            input_stream = "examples/foo_input.txt"

            with contextlib.redirect_stdout(io.StringIO()) as stdout:
                with self.assertLogs("", level="DEBUG") as logs:
                    translator.main(source, target)
                    machine.main(target, input_stream)

            assert stdout.getvalue() == "source LoC: 2 code instr: 6\nfoo\n\ninstr_counter:  15 ticks: 28\n"

            expect_log = [
                "DEBUG:root:TICK:   0 PC:   0 ADDR:   0 MEM_OUT: 0 ACC: 0 \tinput  (','@1:1)",
                "DEBUG:root:input: 'f'",
                "DEBUG:root:TICK:   2 PC:   1 ADDR:   0 MEM_OUT: 102 ACC: 0 \tjz 5  ('['@1:2)",
                "DEBUG:root:TICK:   4 PC:   2 ADDR:   0 MEM_OUT: 102 ACC: 102 \tprint  ('.'@1:3)",
                "DEBUG:root:output: '' << 'f'",
                "DEBUG:root:TICK:   6 PC:   3 ADDR:   0 MEM_OUT: 102 ACC: 102 \tinput  (','@1:4)",
                "DEBUG:root:input: 'o'",
                "DEBUG:root:TICK:   8 PC:   4 ADDR:   0 MEM_OUT: 111 ACC: 102 \tjmp 1  (']'@1:5)",
                "DEBUG:root:TICK:   9 PC:   1 ADDR:   0 MEM_OUT: 111 ACC: 102 \tjz 5  ('['@1:2)",
                "DEBUG:root:TICK:  11 PC:   2 ADDR:   0 MEM_OUT: 111 ACC: 111 \tprint  ('.'@1:3)",
                "DEBUG:root:output: 'f' << 'o'",
                "DEBUG:root:TICK:  13 PC:   3 ADDR:   0 MEM_OUT: 111 ACC: 111 \tinput  (','@1:4)",
                "DEBUG:root:input: 'o'",
                "DEBUG:root:TICK:  15 PC:   4 ADDR:   0 MEM_OUT: 111 ACC: 111 \tjmp 1  (']'@1:5)",
                "DEBUG:root:TICK:  16 PC:   1 ADDR:   0 MEM_OUT: 111 ACC: 111 \tjz 5  ('['@1:2)",
                "DEBUG:root:TICK:  18 PC:   2 ADDR:   0 MEM_OUT: 111 ACC: 111 \tprint  ('.'@1:3)",
                "DEBUG:root:output: 'fo' << 'o'",
                "DEBUG:root:TICK:  20 PC:   3 ADDR:   0 MEM_OUT: 111 ACC: 111 \tinput  (','@1:4)",
                "DEBUG:root:input: '\\n'",
                "DEBUG:root:TICK:  22 PC:   4 ADDR:   0 MEM_OUT: 10 ACC: 111 \tjmp 1  (']'@1:5)",
                "DEBUG:root:TICK:  23 PC:   1 ADDR:   0 MEM_OUT: 10 ACC: 111 \tjz 5  ('['@1:2)",
                "DEBUG:root:TICK:  25 PC:   2 ADDR:   0 MEM_OUT: 10 ACC: 10 \tprint  ('.'@1:3)",
                "DEBUG:root:output: 'foo' << '\\n'",
                "DEBUG:root:TICK:  27 PC:   3 ADDR:   0 MEM_OUT: 10 ACC: 10 \tinput  (','@1:4)",
                "WARNING:root:Input buffer is empty!",
                "INFO:root:output_buffer: 'foo\\n'",
            ]
            assert logs.output == expect_log
