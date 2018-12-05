with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "geth";
    buildInputs = [
        go-ethereum
    ];
    shellHook = ''
	#export NIX_PATH=nixpkgs=$HOME/.dapp/dapptools:$NIX_PATH
    	#nix-env -f $HOME/.dapp/dapptools -iA dapp seth solc hevm ethsign
	alias attach="geth --testnet --rpcapi db,eth,net,web3,personal attach"
	alias console="geth --testnet --syncmode "light" --cache=1024 console"
	alias load-ens="loadScript('./ensutils-testnet.js');"
    '';
}
