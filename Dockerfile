ARG ALPINE_VERSION=3.18
FROM alpine:${ALPINE_VERSION}
LABEL Maintainer="dzzhyk <dzzhyk@qq.com>"
LABEL Description="Minecraft blessing skin server runtime environment with Nginx 1.24 & PHP 8.1 based on Alpine Linux."

WORKDIR /var/www/html
USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

# Install packages and remove default server definition for blessing skin
RUN apk add --no-cache \
    curl \
    nginx \
    php81 \
    php81-ctype \
    php81-curl \
    php81-dom \
    php81-fpm \
    php81-gd \
    php81-intl \
    php81-mbstring \
    php81-mysqli \
    php81-opcache \
    php81-openssl \
    php81-phar \
    php81-session \
    php81-xml \
    php81-xmlreader \
    php81-zip \
    php81-pdo \
    php81-mbstring  \
    php81-tokenizer  \
    php81-ctype  \
    php81-fileinfo \
    php81-pdo_sqlite \
    supervisor

# Configure nginx - http
COPY config/nginx.conf /etc/nginx/nginx.conf
# Configure nginx - default server
COPY config/conf.d /etc/nginx/conf.d/

# Configure PHP-FPM
COPY config/fpm-pool.conf /etc/php81/php-fpm.d/www.conf
COPY config/php.ini /etc/php81/conf.d/custom.ini

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add application
COPY blessing-skin-server/ /var/www/html/
RUN mv .env.example .env
RUN php artisan key:generate

RUN mkdir /data
VOLUME ["/data"]

EXPOSE 8080

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Configure a healthcheck to validate that everything is up&running
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping
