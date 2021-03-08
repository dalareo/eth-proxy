FROM ubuntu:xenial
MAINTAINER David A. Lareo dalareo@gmail.com

EXPOSE 8082

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python-twisted git
RUN git clone https://github.com/dalareo/eth-proxy.git /app

WORKDIR /app/

RUN useradd eth-proxy && echo "eth-proxy:eth-proxy" | chpasswd
RUN chown -R eth-proxy:eth-proxy /app
USER eth-proxy

ENTRYPOINT ["python", "/app/eth-proxy.py"]
CMD [""]
