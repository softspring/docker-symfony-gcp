#!/bin/bash

set -x

composer check-platform-reqs

set -e +x

apk update

PHP_ENABLED_EXTENSIONS=(`php -m | sed -r '/^\s*$/d' | sed -r '/^\[/d' | sort | uniq`)
PHP_INSTALLED_EXTENSIONS=(`apk list php7* --installed | sed -r 's/^php7\-/\1/' | sed -r 's/\-?[0-9]+\.[0-9]+.*/\1/' | sed -r '/^\s*$/d' | sort | uniq`)
PHP_AVAILABLE_EXTENSIONS=(`apk list php7* | sed -r '/^\[installed\]/d' | sed -r 's/^php7\-/\1/' | sed -r 's/\-?[0-9]+\.[0-9]+.*/\1/' | sed -r '/^\s*$/d' | sort | uniq`)
COMPOSER_MISSING_EXTENSIONS=(`composer check-platform-reqs | grep missing | sed -r 's/ext\-(.*)\s*n\/a.*/\1/' | sort | uniq`)

contains ()
{
    param=$1;
    shift;
    for elem in "$@";
    do
        [[ "$param" = "$elem" ]] && return 0;
    done;
    return 1
}

for extension in "${COMPOSER_MISSING_EXTENSIONS[@]}"
do
    if contains "$extension" "${PHP_INSTALLED_EXTENSIONS[@]}"
    then
        echo "-> $extension extension is already installed, so enable it"
    else
        if contains "$extension" "${PHP_AVAILABLE_EXTENSIONS[@]}"
        then
            echo "-> $extension extension is available but not installed, so install and enable it"
            apk --no-cache add php7-$extension
        else
            echo "-> $extension extension is not available"
            exit 1
        fi
    fi
done

set -xe
composer check-platform-reqs