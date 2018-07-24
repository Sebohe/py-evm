FROM alpine:edge

RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> \
    /etc/apk/repositories  
RUN apk upgrade
RUN apk add --update --no-cache \
    build-base \
    python3-dev \
    libffi-dev  \
    gmp-dev \
    leveldb-dev \
    linux-headers \
    libressl-dev

ADD . .
RUN python3 setup.py install

ENTRYPOINT ["trinity"]
