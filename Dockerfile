FROM ubuntu 
RUN apt update 
RUN apt install apache2 -y
RUN apt install apache2-utils -y
RUN apt clean 
FROM httpd:latest
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY index.html /usr/local/apache2/htdocs/
EXPOSE 80
CMD [“/etc/init.d/apache2”, “start”]