FROM node:lts-alpine

RUN apk update && apk add --no-cache \
    git; \
    rm -rf /var/cache/apk/*

WORKDIR /app

RUN git clone --depth=1 https://github.com/YMFE/yapi.git vendors

RUN cp vendors/config_example.json ./config.json; \
    cd vendors; \
    npm install --production --registry https://registry.npm.taobao.org; \
    npm run install-server

CMD [ "node", "/app/vendors/server/app.js" ]
