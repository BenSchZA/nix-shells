with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "eth";
  buildInputs = [
    altcoins.go-ethereum
    #parity
  ];
  shellHook = ''
    alias help="
        echo 'Parity config: ~/.local/share/io.parity.ethereum/'
        echo 'Geth config: ~/.ethereum/geth/'
    ";
    #export NIX_PATH=nixpkgs=$HOME/.dapp/dapptools:$NIX_PATH
    #nix-env -f $HOME/.dapp/dapptools -iA dapp seth solc hevm ethsign
    alias attach="geth --rinkeby --rpcapi db,eth,net,web3,personal attach"
    alias attach-parity="geth --rpcapi db,eth,net,web3,personal attach"
    alias node="geth --rinkeby --syncmode "light" --cache=1024 console --rpc --rpcaddr 'localhost' --rpcport 8545 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --rpccorsdomain 'http://remix.ethereum.org'"
    alias node-parity="parity --light --chain="rinkeby" --geth --jsonrpc-apis "all"
    #--bootnodes "enode://6332792c4a00e3e4ee0926ed89e0d27ef985424d97b6a45bf0f23e51f0dcb5e66b875777506458aea7af6f9e4ffb69f43f3778ee73c81ed9d34c51c4b16b0b0f@52.232.243.152:30303,enode://94c15d1b9e2fe7ce56e458b9a3b672ef11894ddedd0c6f247e0f1d3487f52b66208fb4aeb8179fce6e3a749ea93ed147c37976d67af557508d199d9594c35f09@192.81.208.223:30303""
    #alias load-ens="loadScript('./ensutils-testnet.js');"
    alias geth-dev="echo 'geth --dev --rpcapi db,eth,net,web3,personal,debug --datadir dev-geth'"
    alias parity-dev="echo 'parity --config dev --jsonrpc-apis "all" --geth'"
    alias cliquebait-dev="echo 'docker run --rm -it -p 8501:8545 -v ./cliquebait/extra-accounts.json:/extra-accounts.json foamspace/cliquebait:latest'"
  '';
}

