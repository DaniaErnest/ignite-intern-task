FROM node:21-alpine

RUN mkdir -p /home/app

COPY ./app /home//app

WORKDIR /home/app

EXPOSE 3000

CMD [ "node", "app.js" ]