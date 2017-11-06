FROM node:8.9.0-alpine

ENV AWS_CLI_VERSION 1.11.181
ENV WATCHMAN_VERSION 4.9.0
ENV DOCKER_COMPOSE_VERSION 1.16.1

RUN set -ex; \
    apk add --no-cache bash git openssl-dev openssh-client ca-certificates curl g++ \
        linux-headers make autoconf automake libtool python-dev py2-pip; \

    # AWS CLI
    pip install awscli==${AWS_CLI_VERSION}; \
    aws --version; \

    # Google Cloud SDK
    curl https://sdk.cloud.google.com | bash; \
    /root/google-cloud-sdk/bin/gcloud components install kubectl; \
    echo "export PATH=$PATH:/root/google-cloud-sdk/bin" >> /etc/profile; \
    
    # Docker
    apk add --no-cache docker; \
    docker --version; \

    # Docker Compose
    pip install docker-compose==${DOCKER_COMPOSE_VERSION}; \
    docker-compose --version; \

    # Watchman
    cd /tmp; curl -LO https://github.com/facebook/watchman/archive/v${WATCHMAN_VERSION}.tar.gz; \
    tar xzf v${WATCHMAN_VERSION}.tar.gz; rm v${WATCHMAN_VERSION}.tar.gz; \
    cd watchman-${WATCHMAN_VERSION}; \
    ./autogen.sh; ./configure; make && make install; \
    cd /tmp; rm -rf watchman-${WATCHMAN_VERSION}; \
    watchman --version

    # TODO: Add Chrome (headless) dependenciees
