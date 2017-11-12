# Matiec build container
#
# Contains complete matiec installation to perform compilation for languages in
# IEC 61131-3 standart.
# See more information about matiec at: https://bitbucket.org/mjsousa/matiec
#
# Usage:
#
# To compile IEC-sources in current directory:
# docker run --rm -v "$(pwd):/src" -t matiec_build_container iec_source_file.st

FROM debian:stretch

LABEL description="Matiec build container"
LABEL maintainer="Georgy Komarov <jubnzv@gmail.com>"

# Install dependencies
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install  flex \
                        bison \
                        mercurial \
                        make \
                        gcc \
                        g++ \
                        autoconf \
                        sudo adduser && \
    apt-get autoremove -y; apt-get clean; \
    rm /var/lib/apt/lists/* -r; rm -rf /usr/share/man/*

# Install latest matiec version from official repo
RUN hg clone https://bitbucket.org/mjsousa/matiec/ && \
    cd matiec && \
    autoreconf -i && \
    ./configure && \
    make && make install

# Create user and initialize build environment
RUN adduser --disabled-password builder; \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER builder

COPY run.sh /

ENTRYPOINT ["/run.sh"]

