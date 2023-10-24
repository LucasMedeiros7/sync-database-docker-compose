FROM node:18-alpine

ENV DOCKERIZE_VERSION v0.2.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /app

COPY package*.json .
COPY index.js .
COPY scripts/wait-db.sh .

RUN npm install

RUN chmod +x wait-db.sh
ENTRYPOINT ./wait-db.sh

EXPOSE 3000