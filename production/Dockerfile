FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y libicu-dev libxml2 libcurl3 libbsd0

# Check if we should install mysql header files to the container (Defualt: false)
ARG INSTALL_MYSQL=false
RUN if [ ${INSTALL_MYSQL} = true ]; then \
    apt-get update && \
    apt-get install -y libmysqlclient20 libmysqlclient-dev && \
    rm -r /var/lib/apt/lists/* \
 ;fi

# Check if we should install postgres header files to the container (Defualt: false)
ARG INSTALL_PGSQL=false
RUN if [ ${INSTALL_PGSQL} = true ]; then \
      apt-get update && \
      apt-get install -y libpq-dev && \
      rm -r /var/lib/apt/lists/* \
;fi

# Check if we should install sqlite header files to the container (Defualt: false)
ARG INSTALL_SQLITE=false
RUN if [ ${INSTALL_SQLITE} = true ]; then \
      apt-get update && \
      apt-get install -y libsqlite3-dev && \
      rm -r /var/lib/apt/lists/* \
;fi

WORKDIR /vapor

ADD .build/release/App /vapor
ADD .build/release/libCLibreSSL.so /usr/lib
ADD docker/libs/libswiftCore.so /usr/lib
ADD docker/libs/libFoundation.so /usr/lib
ADD docker/libs/libswiftGlibc.so /usr/lib
ADD docker/libs/libdispatch.so /usr/lib
COPY /Config /vapor/Config

EXPOSE 8080
