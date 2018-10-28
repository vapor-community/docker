FROM ubuntu:16.04

LABEL maintainer="zyxep"

# Install CURL
# Get Vapor repo including Swift
# Installing Swift & Vapor
RUN apt-get update && \
    apt-get -y install curl && \
    rm -rf /var/lib/apt/lists/*; && \
    curl -sL https://apt.vapor.sh | bash; && \
    apt-get update && \
    apt-get -y install swift vapor && \
    rm -rf /var/lib/apt/lists/*;

WORKDIR /vapor

RUN ["vapor", "--help"]
