FROM ubuntu:16.04

LABEL maintainer="letsspeak"

# Install CURL
RUN apt-get update && \
    apt-get -y install curl && \
    rm -rf /var/lib/apt/lists/*;

# Install Swift & Vapor & dependencies
RUN curl -sL https://apt.vapor.sh | bash
RUN apt-get update && \
    apt-get -y install swift vapor cmysql && \
    rm -rf /var/lib/apt/lists/*;

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash
RUN apt-get update && \
    apt-get -y install nodejs && \
    rm -rf /var/lib/apt/lists/*

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && \
    apt-get -y install yarn && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/stock
