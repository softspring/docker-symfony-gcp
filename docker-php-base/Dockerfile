FROM php:7.3-alpine3.11

# Install base packages: PHP, NGINX, SUPERVISOR
RUN apk --no-cache add nginx supervisor bash php7 php7-fpm \
    php7-ctype php7-dom php7-json php7-iconv php7-mbstring php7-intl \
    php7-xml php7-openssl php7-phar unzip php7-opcache

COPY --from=composer:1.8 /usr/bin/composer /usr/bin/composer

ENV NGINX_DIR=/etc/nginx \
    APP_DIR=/app \
    PHP_DIR=/etc/php7

EXPOSE 8080

WORKDIR "/${APP_DIR}"

# Prepare environment
RUN mkdir -p "/${APP_DIR}"

# Configure PHP
COPY config/php7/conf.d/ $PHP_DIR/conf.d/
COPY config/php7/php-fpm.d/ $PHP_DIR/php-fpm.d/

# Configure nginx
RUN mkdir -p /run/nginx
COPY config/nginx "${NGINX_DIR}"

# Prepare scripts
COPY scripts /scripts
RUN chmod +x /scripts -R

# Configure supervisord
COPY config/supervisor /etc/supervisor

# Configure runtime
CMD ["/scripts/cmd.sh"]
