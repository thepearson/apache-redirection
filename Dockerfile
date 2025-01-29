FROM httpd:alpine

COPY ./redirects.conf /usr/local/apache2/conf/redirects.conf
COPY ./redirects.txt /usr/local/apache2/conf/redirects.txt
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./webroot/index.html /usr/local/apache2/htdocs

ENTRYPOINT ["httpd-foreground"]