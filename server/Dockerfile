FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --omit=dev

COPY . server/

USER node

CMD [ "npm","start" ,"--prefix","server" ]

EXPOSE 8000
