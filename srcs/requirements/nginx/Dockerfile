## DOCKERFILE FILE ##

FROM	debian:bullseye

RUN	apt update -y && apt upgrade -y && apt-get install -y nginx openssl && \
        mkdir -p /etc/nginx/ssl && \
        mkdir -p /run/nginx && \
        chown -R www-data /var/lib/nginx && \
        rm -rf /etc/nginx/sites-available/default

COPY    ./conf/default.conf /etc/nginx/sites-available/default.conf
COPY    ./conf/nginx.conf /etc/nginx/nginx.conf
COPY    ./script/nginx.sh /tmp/nginx.sh

RUN     ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE	443

EXPOSE 80

ENTRYPOINT [ "sh", "/tmp/nginx.sh" ]
