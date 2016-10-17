FROM ibmcom/swift-ubuntu:latest

# Install Vapor Toolbox
RUN curl -sL toolbox.vapor.sh | bash

# Set work dir to /vapor
WORKDIR /vapor

RUN vapor build

CMD [vapor run]
