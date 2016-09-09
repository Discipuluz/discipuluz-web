########################################################
# Dockerfile to build Polymer project and move to server
# Based on oficial nginx Dockerfile
########################################################
FROM node:4

MAINTAINER Rodrigo Seiji Piubeli Hirao <rodrigo.seiji.hirao@gmail.com>

ENV POLYMER_VERSION 0.16.0
ENV BOWER_VERSION 1.7.9

# Install polymer and bower
RUN npm install -g \
    polymer-cli@${POLYMER_VERSION} \
    bower@${BOWER_VERSION}

ENTRYPOINT ["/usr/bin/polymer"]

RUN mkdir -p /usr/share/nginx/html/temp
COPY ../ /usr/share/nginx/html/temp
ONBUILD WORKDIR /usr/share/nginx/html/temp
ONBUILD RUN polymer build
ONBUILD RUN mv -r build/bundled /usr/share/nginx/html/prod
ONBUILD RUN rm -rf ./