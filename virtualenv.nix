let pkgs = import <nixpkgs> {};
  #nanomsg-py = .... build expression for this python library;
in pkgs.stdenv.mkShell {
  buildInputs = [
    pkgs.pythonPackages.pip
    #nanomsg-py
  ];
  shellHook = ''
    alias pip="PIP_PREFIX='$(pwd)/_build/pip_packages' \pip"
    export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python2.7/site-packages:$PYTHONPATH"
    unset SOURCE_DATE_EPOCH
  '';
}
