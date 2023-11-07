FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1 \
  PIP_NO_CACHE_DIR=off \
  POETRY_VERSION=1.6.1

WORKDIR /code
COPY src/brainfuck/poetry.lock src/brainfuck/pyproject.toml /code

RUN pip install --no-cache-dir --progress-bar off "poetry==$POETRY_VERSION"

RUN poetry config virtualenvs.create false \
  && poetry install --no-cache --no-interaction --no-ansi

# docker buildx build --push --platform linux/arm64,linux/amd64 --tag ryukzak/python-tools -f src/Dockerfiles/python-tools.Dockerfile .
# docker run -it ryukzak/python-tools /bin/sh
