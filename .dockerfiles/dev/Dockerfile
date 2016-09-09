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

RUN mkdir -p /usr/share/nginx/html/dev
ONBUILD RUN git clone -b dev https://github.com/Discipuluz/discipuluz-web.git
ONBUILD WORKDIR ./discipuluz-web
ONBUILD RUN polymer build
ONBUILD RUN mv -r build/bundled /usr/share/nginx/html/dev
ONBUILD RUN rm -rf ./