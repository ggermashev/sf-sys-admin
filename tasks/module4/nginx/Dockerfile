FROM nginx:1.27.1

RUN apt-get update
RUN apt-get install systemd -y
RUN apt-get install lynx -y
RUN apt-get install -y apt-utils autoconf automake build-essential git libcurl4-openssl-dev libgeoip-dev liblmdb-dev libpcre3 libpcre3-dev libtool libxml2-dev libyajl-dev pkgconf wget zlib1g-dev

RUN mkdir -p /task/src

COPY ./src/index.html /usr/share/nginx/html
COPY ./src/nginx.conf /etc/nginx/nginx.conf

WORKDIR /etc/ssl/private
COPY ./src/sslconfig.cnf /task/src
RUN openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out nginx.crt -keyout nginx.key -config /task/src/sslconfig.cnf


WORKDIR /task/src
RUN git clone --depth 1 -b v3/master --single-branch https://github.com/SpiderLabs/ModSecurity

WORKDIR ./ModSecurity
RUN git submodule init
RUN git submodule update
RUN ./build.sh
RUN ./configure
RUN make
RUN make install

WORKDIR ../
RUN git clone --depth 1 https://github.com/SpiderLabs/ModSecurity-nginx.git 
RUN wget https://nginx.org/download/nginx-1.27.1.tar.gz
RUN tar zxvf nginx-1.27.1.tar.gz

WORKDIR ./nginx-1.27.1
RUN ./configure --with-compat --add-dynamic-module=../ModSecurity-nginx
RUN make modules
RUN cp objs/ngx_http_modsecurity_module.so /etc/nginx/modules

RUN mkdir /etc/nginx/modsec
RUN wget -P /etc/nginx/modsec/ https://raw.githubusercontent.com/SpiderLabs/ModSecurity/v3/master/modsecurity.conf-recommended
RUN mv /etc/nginx/modsec/modsecurity.conf-recommended /etc/nginx/modsec/modsecurity.conf
RUN sed -i 's/SecRuleEngine DetectionOnly/SecRuleEngine On/' /etc/nginx/modsec/modsecurity.conf
RUN sed -i 's/SecUnicodeMapFile unicode.mapping 20127//' /etc/nginx/modsec/modsecurity.conf

COPY ./src/main.conf /etc/nginx/modsec/main.conf