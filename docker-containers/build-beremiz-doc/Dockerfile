#
# Build container that contains complete environment with all required packages
# to build Beremiz IDE documentation regardless of host OS.
#
# Usage:
# MAKEOPTS = "html latexpdf"
# docker run --rm -v $(BEREMIZ_SRC):/source -t jubnzv/beremiz-doc-build $MAKEOPTS
#
# See more at: https://github.com/jubnzv/beremiz
#

FROM debian:stretch

LABEL maintainer "Georgy Komarov <jubnzv@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install sudo \
                   make \
                   python2.7 \
                   python-sphinx \
                   python-sphinx-rtd-theme \
                   doxygen \
                   graphviz \
                   python-breathe \
                   breathe-doc \
                   texlive-base \
                   texlive-latex-base \
                   texlive-lang-cyrillic \
                   texlive-fonts-recommended \
                   texlive-generic-extra \
                   texlive-latex-extra \
                   texlive-latex-recommended && \
    apt-get autoremove -y; apt-get clean; \
    rm /var/lib/apt/lists/* -r; rm -rf /usr/share/man/*

RUN adduser --disabled-password builder; \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER builder

COPY build /

ENTRYPOINT ["/build"]
