#!/usr/bin/env nix-shell
#!nix-shell -i bash -p gotty gotop --pure

PORT=8888
USERNAME=user
PASSWORD=pass

gotty -p $PORT -c $USERNAME:$PASSWORD gotop
