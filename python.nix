with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "python";
        phases = [ "installPhase" "fixupPhase" ];
        #unpackPhase = "true";
	buildInputs = [
            python37
            python37Packages.pip
            python37Packages.setuptools
	];
	shellHook = ''
            #pip3.7 install manticore --user
	'';
}
