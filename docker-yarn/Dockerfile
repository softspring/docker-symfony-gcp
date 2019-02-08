FROM alpine:3.8

# Install base packages: YARN, NPM, UTILS
RUN apk --no-cache add bash unzip npm yarn curl git nano sudo gnupg nodejs

ENV APP_DIR=/app

EXPOSE 8080

WORKDIR "/${APP_DIR}"

# Prepare environment
RUN mkdir -p "/${APP_DIR}"

# Prepare scripts
COPY scripts /scripts
RUN chmod +x /scripts -R

ONBUILD ARG USER_NAME
ONBUILD ENV USER_NAME=${USER_NAME}
ONBUILD ARG UID
ONBUILD ENV UID=${UID}
ONBUILD RUN /scripts/user_config.sh

ENTRYPOINT ["/scripts/entrypoint.sh"]

CMD ["/scripts/cmd.sh"]
