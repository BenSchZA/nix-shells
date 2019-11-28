#!/usr/bin/env nix-shell
#!nix-shell -i bash -p iodine

PASS=`pass devops/iodine`
sudo iodine -I 50 -f -P $PASS t.bitsofether.com

ssh -ND 3333 root@10.0.0.1

curl -x socks5h://127.0.0.1:3333 http://httpbin.org/ip
