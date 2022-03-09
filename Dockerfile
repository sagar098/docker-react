FROM node:16-alpine as buider

WORKDIR '/app'
COPY package.json .
RUN yarn install

COPY . .

RUN yarn build

FROM nginx
COPY --from=buider /app/build  /usr/share/nginx/html