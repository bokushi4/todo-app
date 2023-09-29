# Pythonベースのイメージを使用
FROM python:3.11-slim-buster

RUN set -eux; \
    apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    vim \
    make \
    git \
    openjdk-11-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --no-cache-dir httpie awscli chalice boto3

WORKDIR /opt/todo_app

COPY ./app ./app

CMD [ "bash" ]
