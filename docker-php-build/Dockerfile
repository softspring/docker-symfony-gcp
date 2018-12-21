FROM softspring/symfony-gcp-php-base:latest

COPY scripts/build /scripts/build
RUN chmod +x /scripts/build -R

ONBUILD ARG COMPOSER_FLAGS='--no-scripts --no-dev --prefer-dist'
ONBUILD ENV COMPOSER_FLAGS=${COMPOSER_FLAGS}

# Prepare code
ONBUILD COPY . $APP_DIR
ONBUILD RUN chown -R nginx.nginx $APP_DIR

# Install extensions and dependencies
ONBUILD RUN /scripts/install/php_ext_config.sh
ONBUILD RUN /scripts/build/composer.sh

# clean up
ONBUILD RUN rm /scripts/build -Rf
ONBUILD RUN rm /scripts/install -Rf
