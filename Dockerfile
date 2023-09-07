FROM ubuntu 
RUN apt update 
RUN apt install apache2 -y
RUN apt install apache2-utils -y
RUN apt clean 
COPY index.html /usr/local/apache2/htdocs/
EXPOSE 80
RUN /etc/init.d/apache2 start