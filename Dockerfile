FROM node:16-alpine3.14

RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

ENV WORKDIR /usr/src
ENV PATH $PATH:$WORKDIR/node_modules/.bin
WORKDIR $WORKDIR

ADD package.json yarn.lock $WORKDIR/