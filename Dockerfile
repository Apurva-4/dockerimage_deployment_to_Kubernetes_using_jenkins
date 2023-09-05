FROM ubuntu:latest

RUN apt -y install httpd:latest

COPY index.html /var/www/html/

CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]

EXPOSE 80