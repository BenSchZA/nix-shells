with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "dapptools";
	buildInputs = [
		nodejs-10_x pkgconfig autoconf automake libtool nasm autogen zlib
	];
	shellHook = ''
	'';
}
