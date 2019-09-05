FROM python:3.7-alpine
MAINTAINER Chiflado Developer

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Add a user to run the docker image other than root.  It is not advisable
# to run docker images with the root account.
RUN adduser -D user
USER user
