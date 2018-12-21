#!/bin/bash -xe

# CONFIG XDEBUG
if [[ $XDEBUG_ENABLED == 1 ]]
then
    sudo /scripts/dev/xdebug_enable.sh
fi

sudo /scripts/install/php_ext_config.sh

/scripts/dev/composer.sh

sudo /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
