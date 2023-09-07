FROM ubuntu
RUN apt update
RUN apt install apache2 -y
RUN apt install apache2-utils -y
COPY demo.html /usr/local/apache2/htdocs/
EXPOSE 80
ENTRYPOINT ["apache2ctl"]
CMD ["-Dforeground"]
