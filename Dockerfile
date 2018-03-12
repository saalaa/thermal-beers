FROM node:9.7

WORKDIR /app

COPY . /app

RUN npm install

EXPOSE 9331
EXPOSE 9332

CMD [ "node", "web-server.js" ]
