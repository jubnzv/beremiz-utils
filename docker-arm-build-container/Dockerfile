# Debian-based arm crosstoolchain build container
#
# Usage:
# docker run --rm -v "$(pwd):/src" -t arm-build-container

FROM debian:stretch

LABEL description="Matiec build container"
LABEL maintainer="Georgy Komarov <jubnzv@gmail.com>"

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install  flex \
                        bison \
                        make \
                        gcc \
                        g++ \
                        autoconf \
                        gcc-arm-linux-gnueabihf \
                        g++-arm-linux-gnueabihf \
                        sudo adduser && \
    apt-get autoremove -y; apt-get clean; \
    rm /var/lib/apt/lists/* -r; rm -rf /usr/share/man/*

# Create user and initialize build environment
RUN adduser --disabled-password builder; \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER builder

COPY run.sh /

ENTRYPOINT ["/run.sh"]

