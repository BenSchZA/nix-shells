with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "ruby";
	buildInputs = [
            ruby.devEnv
            pkgconfig
            bundix
            icu
            zlib
	];
	shellHook = ''
            ruby -v
	'';
}
