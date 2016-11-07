FROM zyxep/vapor:0.1

# Check if we should install mysql header files to the container (Defualt: false)
ARG INSTALL_MYSQL=false
RUN if [ ${INSTALL_MYSQL} = true ]; then \
    apt-get update && \
    apt-get install -y libmysqlclient18 libmysqlclient-dev && \
    rm -r /var/lib/apt/lists/* \
 ;fi
 
# Set work dir to /vapor
WORKDIR /vapor

EXPOSE 8080
