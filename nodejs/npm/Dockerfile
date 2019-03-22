FROM node:alpine

# 代表生产环境
ENV PROJECT_ENV production
WORKDIR /code
ADD ./app /code
RUN npm install && npm run build && npm install -g http-server
EXPOSE 80

CMD http-server ./dist -p 80
