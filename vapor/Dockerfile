FROM ibmcom/swift-ubuntu:latest

RUN apt-get update && \
    apt-get install -y libmysqlclient18 libmysqlclient-dev \
    && rm -r /var/lib/apt/lists/*

# Install Vapor Toolbox
RUN curl -sL toolbox.vapor.sh | bash

# Remove the Swift source files
#RUN rm -rf ./swift-3.0-RELEASE-ubuntu14.04

# Set work dir to /vapor
WORKDIR /vapor
