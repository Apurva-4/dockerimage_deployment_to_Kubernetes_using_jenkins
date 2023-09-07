FROM httpd:2.4

# Copy your Apache configuration file (if needed)
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Copy your web application files to the Apache document root
COPY index.html /usr/local/apache2/htdocs/