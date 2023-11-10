#!/bin/bash
set -e

# Source
source ~/.bashrc

# git configuration
git config --global core.editor "code --wait"

# Ubuntu info
if [[ $USER == $UBUNTU_USER ]] && [[ $UID == $UBUNTU_UID ]]; then
	echo "User credentials:
    - USERNAME: $HOSTNAME: ($USER:$UID)
    - PASSWORD: $UBUNTU_PSW
    "
else
	echo "User is not set correctly!"
	if ![[ $USER == $UBUNTU_USER ]]; then
		echo "$USER is not $UBUNTU_USER"
	else
		echo "$UID is not $UBUNTU_UID"
	fi
	return
fi


if [[ -n "$CI" ]]; then
    exec /bin/bash
else
    exec "$@"
fi
