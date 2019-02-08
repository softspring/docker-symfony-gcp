FROM softspring/symfony-gcp-php-base:latest

RUN sed -e 's;^#http\(.*\)/v3.6/community;http\1/v3.6/community;g' -i /etc/apk/repositories

RUN apk update && \
    apk --no-cache add sudo php7-xdebug git openssh

COPY scripts/dev /scripts/dev/
COPY scripts/cmd.sh /scripts/
COPY scripts/entrypoint.sh /scripts/
RUN chmod +x /scripts/* -R

ONBUILD ARG USER_NAME
ONBUILD ENV USER_NAME=${USER_NAME}
ONBUILD ARG UID
ONBUILD ENV UID=${UID}
ONBUILD RUN /scripts/dev/user_config.sh

ENTRYPOINT ["/scripts/entrypoint.sh"]

CMD ["/scripts/cmd.sh"]