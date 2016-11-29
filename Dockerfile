FROM ubuntu:14.04

# Set environment variables for image
ENV SWIFT_SNAPSHOT swift-3.0.1-RELEASE
ENV SWIFT_SNAPSHOT_LOWERCASE swift-3.0.1-release
ENV UBUNTU_VERSION ubuntu14.04
ENV UBUNTU_VERSION_NO_DOTS ubuntu1404
ENV HOME /root
ENV WORK_DIR /root

# Set WORKDIR
WORKDIR ${WORK_DIR}

# Linux OS utils and libraries
RUN apt-get update && apt-get install -y \
  clang \
  binutils \
  git \
  libicu-dev \
  wget \
  libxml2 \
  curl && \
  rm -r /var/lib/apt/lists/*

# Install Swift compiler
RUN wget https://swift.org/builds/$SWIFT_SNAPSHOT_LOWERCASE/$UBUNTU_VERSION_NO_DOTS/$SWIFT_SNAPSHOT/$SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && tar xzvf $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && rm $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz
ENV PATH $WORK_DIR/$SWIFT_SNAPSHOT-$UBUNTU_VERSION/usr/bin:$PATH
RUN swiftc -h

# Install Vapor Toolbox
RUN curl -sL toolbox.vapor.sh | bash

# Set work dir to /vapor
WORKDIR /vapor

EXPOSE 8080
