FROM httpd:2.4

RUN apt-get update
RUN apt-get install systemd -y
RUN apt-get install lynx -y


RUN mkdir -p /task/src

COPY ./src/index.html /usr/local/apache2/htdocs/
RUN echo "ServerName 127.0.0.1" >> /usr/local/apache2/conf/httpd.conf

RUN echo "<Location \"/server-status\">" >> /usr/local/apache2/conf/httpd.conf
RUN echo "SetHandler server-status" >> /usr/local/apache2/conf/httpd.conf
RUN echo "</Location>" >> /usr/local/apache2/conf/httpd.conf

WORKDIR /usr/local/apache2/conf
COPY ./src/sslconfig.cnf /task/src
RUN openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out server.crt -keyout server.key -config /task/src/sslconfig.cnf

COPY ./src/writeHttpsConfig.sh /task/src
RUN /task/src/writeHttpsConfig.sh

