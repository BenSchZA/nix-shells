#!/usr/bin/env nix-shell
#!nix-shell -i bash -p altcoins.go-ethereum --pure --keep PRIVATE_KEY --keep PASSWORD --keep PUBLIC_KEY
set -o errexit -o nounset -o pipefail

temp_keyfile=./keyfile.secret
temp_password=./password.secret

cat <<EOF > $temp_keyfile
$PRIVATE_KEY
EOF

cat <<EOF > $temp_password 
$PASSWORD
EOF

#{
#address=$(geth account import --datadir $HOME/.ethereum/rinkeby --password $temp_password $temp_keyfile)
#echo address
#} || {
#address=$PUBLIC_KEY
#echo "Address already exists"
#}

address=$PUBLIC_KEY

#rm $temp_keyfile

geth --rinkeby --syncmode "light" --cache=1024 console --rpc --rpcaddr 'localhost' --rpcport 8545 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --password $temp_password --unlock $address

#rm $temp_password
