FROM node:8.16.0-alpine

RUN apk add --update bash && rm -rf /var/cache/apk/*

# Use private npm
ADD npmrc /root/.npmrc

# Create app directory
RUN mkdir /workspace
WORKDIR /workspace

# Bundle app source
# COPY . /workspace
# RUN npm install
# CMD [ "npm", "start" ]

EXPOSE 8888

RUN npm i -g relaxedjs --unsafe-perm
