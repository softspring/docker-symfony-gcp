#!/bin/bash

if [[ ! "$USER_NAME" ]]
then
    echo "USER_NAME environment variable is required"
    exit 1
fi

if [[ ! "$UID" ]]
then
    echo "UID environment variable is required"
    exit 1
fi

if [ ! -d "/home/$USER_NAME" ]
then
    mkdir -p /home/$USER_NAME
    adduser -u $UID -G users -h /home/$USER_NAME -D $USER_NAME
    chown $USER_NAME /home/$USER_NAME
    chgrp users /home/$USER_NAME
    echo "$USER_NAME ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
fi