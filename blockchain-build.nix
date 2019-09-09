with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "build-env";
	buildInputs = [
		docker
		docker_compose
		nodejs-10_x
		yarn
		pkgconfig
		autoconf
		automake
		libudev
		libtool
		libusb
		nasm
		autogen
		zlib
		nodePackages_10_x.node-gyp
  	nodePackages_10_x.node-gyp-build
  	nodePackages_10_x.node-pre-gyp
		python27
		python27Packages.pip
		python27Packages.setuptools
		kubectl
		git
	];
	shellHook = ''
	'';
}
