FROM ubuntu
RUN apt update
RUN apt install apache2 -y
RUN apt install apache2-utils -y
COPY demo.html /usr/local/apache2/htdocs/
RUN echo "ServerName 10.244.2.191" >> /etc/apache2/apache2.conf
EXPOSE 80
ENTRYPOINT ["apache2ctl"]
CMD ["-Dforeground"]
