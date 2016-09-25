FROM ubuntu:16.04

RUN apt-get update && \
	apt-get install -y --no-install-recommends apg init-system-helpers libtool openssl libssl-dev zlib1g-dev xmlto asciidoc libpcre3 libpcre3-dev
	
# Deploys files
RUN mkdir -p /app
RUN mkdir -p /app/kcp
RUN chmod +x /app

COPY ./*_amd64 /app/kcp

RUN chmod +x /app/kcp/*

COPY ./packages/*.deb /app/
COPY ./*.sh /app/
RUN chmod +x /app/*.sh

RUN	dpkg -i /app/*.deb

RUN     rm -rf /app/*.deb

WORKDIR /app
