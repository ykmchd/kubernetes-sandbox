FROM ubuntu:24.04

RUN apt update
RUN apt install -y python3-flask

WORKDIR /app
COPY ./app.py /app/

CMD ["flask", "run", "--host=0.0.0.0"]
