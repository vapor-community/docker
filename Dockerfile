FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y wget curl
RUN /bin/bash -c "$(wget -qO- https://apt.vapor.sh)"

# Installing Swift and Vapor
RUN apt-get -y install swift vapor
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /vapor

RUN ["vapor", "version"]
