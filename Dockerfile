FROM ubuntu:16.04

LABEL maintainer="zyxep"

RUN apt-get update && \
    apt-get -y install curl && \
    rm -rf /var/lib/apt/lists/*;

RUN curl -sL https://apt.vapor.sh | bash;

RUN apt-get update && \
    apt-get -y install swift=3.1.1 vapor && \
    rm -rf /var/lib/apt/lists/*;

WORKDIR /vapor

RUN ["vapor", "--help"]