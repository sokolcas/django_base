FROM python:3.9
LABEL DANIIL SOKOLOVSKIY

COPY Pipfile .     
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy --system

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user

USER user