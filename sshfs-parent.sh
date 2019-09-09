#!/usr/bin/env nix-shell
#!nix-shell -i bash -p sshfs
set -o errexit -o nounset -o pipefail

PARENT_FOLDER=LinumLabs
PARENT_USERNAME=bscholtz

mkdir -p ~/mount/$PARENT_FOLDER
sshfs $PARENT_USERNAME@$PARENT_IP:$PARENT_FOLDER ~/mount/$PARENT_FOLDER
