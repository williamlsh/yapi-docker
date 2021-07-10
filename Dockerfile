FROM node:lts-alpine

LABEL org.opencontainers.image.source=https://github.com/williamlsh/yapi-docker

RUN apk update && apk add --no-cache \
    git; \
    rm -rf /var/cache/apk/*

WORKDIR /app

ARG docker_compose_wait_version=2.9.0
ARG yapi_version=master

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$docker_compose_wait_version/wait wait

RUN chmod +x wait

RUN git clone --depth=1 --branch $yapi_version --single-branch https://github.com/YMFE/yapi.git vendors

WORKDIR /app/vendors

RUN npm install --production --registry https://registry.npm.taobao.org

CMD ../wait; \
    node server/app.js
