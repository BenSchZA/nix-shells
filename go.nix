with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "go";
	buildInputs = [
		libcap go gcc
	];
	shellHook = ''
	'';
}
