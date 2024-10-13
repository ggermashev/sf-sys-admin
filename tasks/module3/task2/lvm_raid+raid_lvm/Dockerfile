FROM ubuntu:18.04

RUN apt-get update && apt-get install -y mdadm
RUN apt-get install -y lvm2

RUN mkdir -p ./task
RUN mkdir -p ./task/src
RUN mkdir -p ./task/internal/package

WORKDIR /task

CMD ./src/cmd.sh