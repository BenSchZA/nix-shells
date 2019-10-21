with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "python";
  buildInputs = [
    python27
    python27Packages.pip
    python27Packages.setuptools
    python27Packages.virtualenvwrapper
  ];
  shellHook = ''
    export SOURCE_DATE_EPOCH=315532800
    alias pip="PIP_PREFIX='$HOME/.pip_packages' \pip"
    export PYTHONPATH="$HOME/.pip_packages/lib/python2.7/site-packages:$PYTHONPATH"
  '';
}
