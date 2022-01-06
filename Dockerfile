FROM swift:5.5.2
LABEL Description="Docker Container for Vapor"

RUN apt-get update && \
    apt-get install sudo libsqlite3-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN \
    git clone -b 18.3.3 https://github.com/vapor/toolbox.git vapor-toolbox && \
    cd vapor-toolbox && \
    make install

VOLUME /root/sandbox
EXPOSE 8080

WORKDIR /root/sandbox
