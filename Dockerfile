FROM python:3.9-alpine3.13

WORKDIR /app

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt

RUN python -m pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    pip install -r /tmp/requirements.dev.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

USER django-user

COPY ./app /app
