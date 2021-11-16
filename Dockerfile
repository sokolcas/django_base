FROM python:3.10-alpine
LABEL DANIIL SOKOLOVSKIY

ENV PYTHONUNBUFFERED 1
WORKDIR /django_base

RUN pip install -U pipenv
COPY Pipfile .     
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy --system
RUN mkdir /app
WORKDIR /app
COPY . /app
EXPOSE 5000 
RUN adduser -u 1000 -s /bin/sh -D user
RUN chown -R user:user ./
USER user
