#!/bin/bash -xe

if [[ ! "$COMPOSER_HOME" ]]
then
    export COMPOSER_HOME=/home/$USER_NAME/.composer
fi

composer install --no-scripts --dev --no-ansi --no-progress --no-interaction

if [ "$( composer run-script -l --no-ansi 2>/dev/null | grep on-develop | wc -l )" == "1" ]
then
    composer run-script --no-ansi --timeout=0 --dev -- on-develop
fi