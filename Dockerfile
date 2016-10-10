########################################################
# Dockerfile to build Polymer project and move to server
# Based on oficial nginx Dockerfile
########################################################
FROM node:4

MAINTAINER Rodrigo Seiji Piubeli Hirao <rodrigo.seiji.hirao@gmail.com>

VOLUME /var/www/html

# Install polymer and bower
RUN npm install -g \
    polymer-cli \
    bower

# Add project to a temp folder to build it
RUN mkdir -p /var/www/html/temp
COPY . /var/www/html/temp
WORKDIR /var/www/html/temp
RUN polymer build

# Move to release folder and remove temp folder
WORKDIR /var/www/html
RUN mv /var/www/html/temp/build/unbundled /var/www/html
RUN rm -rf /var/www/html/temp

RUN bower install --allow-root

