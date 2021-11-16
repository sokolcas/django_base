FROM python:3.10-alpine
LABEL DANIIL SOKOLOVSKIY


WORKDIR /django_base

RUN pip install -U pipenv
COPY Pipfile .     
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy --system
RUN mkdir /app
WORKDIR /app
COPY . /app

RUN adduser -D user

USER user

USER user