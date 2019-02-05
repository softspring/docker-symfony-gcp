#!/bin/bash -xe

# CONFIG XDEBUG
if [[ $XDEBUG_ENABLED == 1 ]]
then
    sudo -E /scripts/dev/xdebug_enable.sh
fi

sudo -E /scripts/install/php_ext_config.sh

/scripts/dev/composer.sh

sudo -E /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
