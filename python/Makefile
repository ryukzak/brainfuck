all: format lint test

format:
	poetry run ruff format .

lint:
	poetry run ruff check --fix .

test:
	poetry run pytest -v

test-update-golden:
	poetry run pytest . -v --update-goldens
