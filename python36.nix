with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "python";
	buildInputs = [
            python36
            python36Packages.pip
            python36Packages.setuptools
            python36Packages.virtualenvwrapper
	];
	shellHook = ''
	'';
}
