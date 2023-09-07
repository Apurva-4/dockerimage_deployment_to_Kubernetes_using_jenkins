FROM ubuntu:latest

RUN apt update && apt -y install apache2

COPY index.html /var/www/html/

EXPOSE 80