with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "node";
    buildInputs = [
        nodejs-10_x yarn git python27
    ];
    shellHook = ''
	alias yarn="yarn --ignore-engines"
        export PATH="$PWD/node_modules/.bin/:$PATH"
	npm config set cache-min 9999999
	npm config set registry http://localhost:8081/repository/npm-proxy
	yarn config set registry http://localhost:8081/repository/npm-proxy
    '';
}
