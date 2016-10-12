########################################################
# Dockerfile to build Polymer project and move to server
# Based on oficial nginx Dockerfile
########################################################
FROM node:6

MAINTAINER Rodrigo Seiji Piubeli Hirao <rodrigo.seiji.hirao@gmail.com>

# Install polymer and bower
RUN npm install -g \
    polymer-cli \
    bower

# Add project to a temp folder to build it
RUN mkdir -p /var/www/html/temp
COPY . /var/www/html/temp
WORKDIR /var/www/html/temp
RUN bower install --allow-root
RUN polymer build

# Move to release folder
WORKDIR /var/www/html
RUN mv /var/www/html/temp/build/unbundled /var/www/html
RUN bower install --allow-root

# Remove temporary content
RUN rm -rf /var/www/html/temp

VOLUME /var/www/html