#!/bin/bash -xe

if [[ ! "$COMPOSER_FLAGS" ]]
then
    export COMPOSER_FLAGS="--no-scripts --no-dev --prefer-dist"
fi

composer install --optimize-autoloader --no-interaction --no-ansi --no-progress ${COMPOSER_FLAGS}

if [ "$( composer run-script -l --no-ansi 2>/dev/null | grep on-build | wc -l )" == "1" ]
then
    composer run-script --no-ansi --timeout=0 --dev -- on-build
fi