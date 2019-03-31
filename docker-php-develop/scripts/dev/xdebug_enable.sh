#!/bin/bash -e

echo "Enabling Xdebug for PHP 7.2"

if [[ ! "$XDEBUG_REMOTE_PORT" ]]
then
    XDEBUG_REMOTE_PORT=9000
fi

if [[ ! "$XDEBUG_IDEKEY" ]]
then
    XDEBUG_IDEKEY="PHPSTORM"
fi

if [[ ! "$XDEBUG_REMOTE_HOST" ]]
then
    XDEBUG_REMOTE_HOST="172.18.0.1"
fi

sudo -E bash -c 'rm -f /etc/php7/conf.d/xdebug.ini'
sudo -E bash -c 'echo "zend_extension=xdebug.so" > /etc/php7/conf.d/50_xdebug.ini'
sudo -E bash -c 'echo "xdebug.default_enable=1" >> /etc/php7/conf.d/50_xdebug.ini'
sudo -E bash -c 'echo "xdebug.remote_enable=1" >> /etc/php7/conf.d/50_xdebug.ini'
sudo -E bash -c 'echo "xdebug.remote_autostart=1" >> /etc/php7/conf.d/50_xdebug.ini'
sudo -E bash -c 'echo "xdebug.remote_connect_back=1" >> /etc/php7/conf.d/50_xdebug.ini'
sudo -E bash -c 'echo "xdebug.remote_host=$XDEBUG_REMOTE_HOST" >> /etc/php7/conf.d/50_xdebug.ini'
sudo -E bash -c 'echo "xdebug.remote_port=$XDEBUG_REMOTE_PORT" >> /etc/php7/conf.d/50_xdebug.ini'
sudo -E bash -c 'echo "xdebug.idekey=$XDEBUG_IDEKEY" >> /etc/php7/conf.d/50_xdebug.ini'