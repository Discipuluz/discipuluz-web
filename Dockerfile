########################################################
# Dockerfile to build Polymer project and move to server
# Also starts nginx server
# Based on oficial nginx Dockerfile
########################################################
FROM nginx:alpine

MAINTAINER Rodrigo Seiji Piubeli Hirao <rodrigo.seiji.hirao@gmail.com>

# Install node, polymer and bower
RUN apk add --no-cache \
    git
    nodejs

RUN npm install -g \
    polymer-cli \
    bower

# Add project to a temp folder to build it
RUN mkdir -p /var/www/html/temp
COPY . /var/www/html/temp
WORKDIR /var/www/html/temp
RUN ls -la
RUN bower install --allow-root
RUN polymer build

# Move to release folder
WORKDIR /var/www/html
RUN mv /var/www/html/temp/build/unbundled/* /var/www/html
RUN bower install --allow-root

# Remove temporary content
RUN rm -rf /var/www/html/temp

# Nginx config file
VOLUME /etc/nginx

# exposing ports 80 for server and 443 for SSL
EXPOSE 80 443