FROM python:3.9

RUN useradd --create-home userapi
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
RUN pip install -U pipenv
COPY Pipfile .     
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy --system
COPY ./app /app
RUN chown -R userapi:userapi ./
EXPOSE 8000 

USER userapi
