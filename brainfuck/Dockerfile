FROM python:3.11-alpine

ENV PYTHONUNBUFFERED=1 \
  PIP_NO_CACHE_DIR=off \
  POETRY_VERSION=1.5.1

RUN mkdir /code
COPY poetry.lock pyproject.toml /code
WORKDIR /code

RUN apk update && apk add python3-dev gcc libc-dev libffi-dev

RUN pip install --upgrade --progress-bar off pip && pip install --progress-bar off "poetry==$POETRY_VERSION"

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

# docker build --tag ryukzak/python-tools .
# docker push ryukzak/python-tools
# docker run -it ryukzak/python-tools /bin/sh
