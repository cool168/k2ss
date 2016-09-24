FROM ubuntu:16.04

RUN apt-get update && \
	apt-get install -y install build-essential autoconf libtool openssl libssl-dev zlib1g-dev xmlto asciidoc libpcre3 libpcre3-dev
	
# Deploys files
RUN mkdir -p /app
RUN mkdir -p /app/kcp
RUN chmod +x /app
COPY ./client_linux_amd64 /app/kcp
COPY ./server_linux_amd64 /app/kcp
RUN chmod +x /app/kcp/client_linux_amd64
RUN chmod +x /app/kcp/server_linux_amd64

COPY ./packages/*.deb /app/
COPY ./*.sh /app/
RUN chmod +x /app/*.sh

RUN	dpkg -i /app/shadowsocks-libev_*.deb
RUN	rm /etc/init.d/shadowsocks-libev
RUN     rm -rf /app/*.deb

WORKDIR /app
