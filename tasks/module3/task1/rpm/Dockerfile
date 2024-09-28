FROM fedora:37

RUN sudo dnf install iputils -y
RUN sudo dnf install dos2unix -y

RUN mkdir -p ./task
RUN sudo dnf install rpmdev* pinentry -y
RUN sudo dnf install rpm-sign -y
RUN rpmdev-setuptree

WORKDIR /root/rpmbuild/SOURCES
RUN mkdir script1-1.0

WORKDIR ./script1-1.0
COPY ./src/script1.sh ./script1
RUN chmod +x ./script1

WORKDIR ../
RUN tar -cvzf ./script1-1.0.tar.gz ./script1-1.0

WORKDIR /root/rpmbuild/SPECS
COPY ./src/script1.spec ./script1.spec
RUN sudo dos2unix -b ./script1.spec
RUN rpmbuild -ba ./script1.spec

WORKDIR /root/rpmbuild/RPMS/x86_64
RUN sudo rpm -i script1-1.0-1.fc37.x86_64.rpm

WORKDIR /task/src
COPY ./src/key-settings ./key-settings
RUN mkdir -p /root/.gnupg/public-keys.d
RUN rm -f /root/.gnupg/public-keys.d/pubring.db.lock
RUN gpg2 --gen-key --batch ./key-settings

WORKDIR /task/src
copy ./src/cmd.sh ./cmd.sh
CMD ./cmd.sh




