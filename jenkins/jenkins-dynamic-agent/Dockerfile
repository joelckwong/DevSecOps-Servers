FROM jenkins/inbound-agent:latest-alpine-jdk21

USER root

RUN apk add --no-cache \
    git \
    curl \
    bash \
    wget \
    unzip \
    maven \
    docker-cli

USER jenkins
