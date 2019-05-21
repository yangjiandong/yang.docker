FROM weihanli/puppeteer:node10-stable

LABEL maintainer="one@qq.com"

# It's a good idea to use dumb-init to help prevent zombie chrome processes.
# ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
# RUN chmod +x /usr/local/bin/dumb-init

# Use private npm
ADD npmrc /home/pptruser/.npmrc
ADD npmrc /root/.npmrc
RUN npm i puppeteer

USER root
# RUN git clone https://github.com/RelaxedJS/ReLaXed.git
COPY ReLaXed-master.zip .
RUN unzip ReLaXed-master.zip \
  && cd ReLaXed-master && npm install && npm link --unsafe-perm=true

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["dumb-init", "relaxed"]
