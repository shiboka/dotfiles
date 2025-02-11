FROM python:3.12-alpine

ADD . /app
WORKDIR /app

RUN pip install -r requirements.txt

ENTRYPOINT [ "gunicorn" ]
