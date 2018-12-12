with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "docker";
	buildInputs = [
		docker-compose
	];
	shellHook = ''
	'';
}
