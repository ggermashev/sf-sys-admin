FROM ubuntu:18.04

RUN apt-get update && apt-get install -y dpkg-sig
RUN apt-get install gnupg2 -y

RUN mkdir -p ./task
RUN mkdir -p ./task/src
RUN mkdir -p ./task/internal/package

WORKDIR ./task/internal
RUN mkdir -p ./package/DEBIAN
RUN mkdir -p ./package/usr/local/bin

COPY ./src/task2.sh ./package/usr/local/bin/shell.sh
COPY ./src/control ./package/DEBIAN/control
RUN chmod +x ./package/usr/local/bin/shell.sh
RUN dpkg-deb --build ./package

COPY ./src/key-settings ./key-settings
RUN gpg2 --gen-key --batch ./key-settings
RUN gpg2 --export -a "grigorii germashev deb" > ./DEB-GPG-KEY-Grigorii-Germashev

WORKDIR /task/src
COPY ./src/cmd.sh ./cmd.sh
CMD ./cmd.sh


