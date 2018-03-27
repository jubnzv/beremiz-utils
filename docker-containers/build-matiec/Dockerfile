# MATIEC build container
#
# Description:
#
#   Contains complete matiec installation to perform compilation for languages in
#   IEC 61131-3 standart.
#
#   See more information about matiec at: https://bitbucket.org/mjsousa/matiec
#
# Usage:
#
#   To compile IEC-sources from current directory:
#   docker run --rm -v "$(pwd)":/src jubnzv1/build-matiec:latest iec_source_file.st
#

FROM alpine:3.7

LABEL description="MATIEC build container"
LABEL maintainer="Georgy Komarov <jubnzv@gmail.com>"

# Install build tools
RUN apk add --no-cache \
    gcc g++ libstdc++ bison flex autoconf automake make mercurial musl-dev

# Build latest MATIEC version from official repo
RUN hg clone https://bitbucket.org/mjsousa/matiec/ && \
    cd /matiec && \
    autoreconf -i && \
    ./configure \
    make && make install

# Initialize MATIEC workflow
ENV MATIEC_INCLUDE_PATH /matiec/lib
ENV MATIEC_C_INCLUDE_PATH /matiec/lib/C
ENV PATH /matiec:$PATH
RUN mkdir -pv /src

# Build script
COPY run.sh /matiec
ENTRYPOINT ["/matiec/run.sh"]
