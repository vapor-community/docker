FROM swift

# Install Vapor Toolbox
RUN curl -sL toolbox.vapor.sh | bash

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

# Set work dir to /vapor
WORKDIR /vapor
VOLUME /vapor
EXPOSE 8080

ARG EXECUTABLE=Run

ENV EXECUTABLE=$EXECUTABLE

CMD swift build -c release && .build/release/Run
