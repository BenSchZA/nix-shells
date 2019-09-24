with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "python";
  buildInputs = [
    python37
    python37Packages.pip
    python37Packages.setuptools
    python37Packages.virtualenvwrapper
  ];
  shellHook = ''
    export SOURCE_DATE_EPOCH=315532800
    alias pip="PIP_PREFIX='$HOME/.pip_packages' \pip"
    export PYTHONPATH="$HOME/.pip_packages/lib/python3.7/site-packages:$PYTHONPATH"
  '';
}
