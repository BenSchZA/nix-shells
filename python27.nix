with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "python";
	buildInputs = [
            python27
            python27Packages.pip
            python27Packages.setuptools
	];
	shellHook = ''
	'';
}
