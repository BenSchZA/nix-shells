with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "python";
	buildInputs = [
            python37
            python37Packages.pip
            python37Packages.setuptools
	];
	shellHook = ''
            alias pip="PIP_PREFIX='$(pwd)/_build/pip_packages' \pip"
            export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python3.7/site-packages:$PYTHONPATH"
            unset SOURCE_DATE_EPOCH
	'';
}
