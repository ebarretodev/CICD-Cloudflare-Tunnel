FROM public.ecr.aws/docker/library/node:lts-alpine

WORKDIR /usr/src/app

COPY ./index.js .
COPY ./package.json .
COPY ./package-lock.json .

RUN npm i

EXPOSE 3000

CMD [ "npm", "run", "start" ]
