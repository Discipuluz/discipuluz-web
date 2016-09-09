########################################################
# Dockerfile to build Polymer project and move to server
# Based on oficial nginx Dockerfile
########################################################
FROM node:4

MAINTAINER Rodrigo Seiji Piubeli Hirao <rodrigo.seiji.hirao@gmail.com>

# Install polymer and bower
RUN npm install -g \
    polymer-cli \
    bower

ENTRYPOINT ["/usr/bin/polymer"]

RUN mkdir -p /usr/share/nginx/html/temp
COPY . /usr/share/nginx/html/temp
WORKDIR /usr/share/nginx/html/temp
RUN polymer build
RUN mv build/unbundled /usr/share/nginx/html/dev
RUN rm -rf /usr/share/nginx/html/temp

WORKDIR /usr/share/nginx/html/dev
ONBUILD RUN pypolyback -s

EXPOSE 8888