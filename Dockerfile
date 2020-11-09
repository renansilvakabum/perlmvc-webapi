FROM nginx:1.10

RUN export HTTP_BASEAPP=/var/www
RUN apt-get clean && apt-get update && apt-get install -y libjson-perl libdancer2-perl nano spawn-fcgi fcgiwrap wget curl
RUN sed -i 's/www-data/nginx/g' /etc/init.d/fcgiwrap
RUN chown nginx:nginx /etc/init.d/fcgiwrap
ADD ./vhost.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www

CMD /etc/init.d/fcgiwrap start \
    && nginx -g 'daemon off;'