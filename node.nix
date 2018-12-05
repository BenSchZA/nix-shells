with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "node";
    buildInputs = [
        nodejs-10_x yarn git python27
    ];
    shellHook = ''
	alias yarn="yarn --ignore-engines"
        export PATH="$PWD/node_modules/.bin/:$PATH"
    '';
}
