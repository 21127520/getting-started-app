# syntax=docker/dockerfile:1

FROM node:18-alpine
#FROM ubuntu:latest
WORKDIR /app
COPY . .
#RUN apt-get update && apt-get install -y sudo
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 8080