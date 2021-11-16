FROM python:3.9
LABEL DANIIL SOKOLOVSKIY

RUN pip install -U pipenv
COPY Pipfile .     
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy --system

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN useradd --create-home userapi   
RUN chown userapi:userapi -R /app/
RUN chmod +x /app
USER userapi