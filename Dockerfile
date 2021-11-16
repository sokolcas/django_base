FROM python:3.10
LABEL DANIIL SOKOLOVSKIY

RUN pip install -U pipenv
COPY Pipfile .     
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy --system

RUN useradd -ms /bin/bash  user 
WORKDIR /app
COPY . /app/
RUN chown -R user:user ./
RUN chmod +x ./   

USER user