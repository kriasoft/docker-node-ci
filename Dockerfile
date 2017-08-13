FROM node:8.3.0-alpine
MAINTAINER Konstantin Tarkus <hello@tarkus.me>

ENV AWS_CLI_VERSION 1.11.133
ENV WATCHMAN_VERSION 4.7.0
ENV DOCKER_COMPOSE_VERSION 1.15.0

RUN apk add --no-cache bash git openssh-client ca-certificates curl docker \
        gcc g++ linux-headers make autoconf automake python-dev py2-pip \
        chromium chromium-chromedriver && \
    pip install awscli==${AWS_CLI_VERSION} docker-compose==${DOCKER_COMPOSE_VERSION} && \
    cd /tmp && curl -LO https://github.com/facebook/watchman/archive/v${WATCHMAN_VERSION}.tar.gz && \
    tar xzf v${WATCHMAN_VERSION}.tar.gz && rm v${WATCHMAN_VERSION}.tar.gz && \
    cd watchman-${WATCHMAN_VERSION} && \
    ./autogen.sh && \
    ./configure && \
    make && make install && \
    cd /tmp && rm -rf watchman-${WATCHMAN_VERSION} && \
    apk del gcc g++ linux-headers make autoconf automake
