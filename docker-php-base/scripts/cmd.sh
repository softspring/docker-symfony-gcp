#!/bin/bash -xe

composer on-deploy

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
