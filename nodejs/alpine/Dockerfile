FROM yangjiandong/base-alpine
RUN apk update && apk upgrade
RUN apk add nodejs

# Exclude npm cache from the image
VOLUME /root/.npm

# Use private npm
ADD npmrc /root/.npmrc

#RUN npm cache clean -f

#RUN npm install -g cnpm --registry=https://registry.npm.taobao.org && \
#    npm install -g nodeppt

#WORKDIR /data
#VOLUME /data

#EXPOSE 8080
#ADD run_json-server.sh /run.sh
#ENTRYPOINT ["bash", "/run.sh"]
#CMD []
