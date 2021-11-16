FROM python:3.10
LABEL DANIIL SOKOLOVSKIY

RUN useradd --create-home user 
WORKDIR /django_base

RUN pip install -U pipenv
COPY Pipfile .     
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy --system
COPY . /django_base/
RUN sudo chown -R user:user .
RUN chmod +x ./   

USER user