with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "python";
  buildInputs = [
    python37
    python37Packages.pip
    python37Packages.setuptools
    python37Packages.virtualenvwrapper
  ];
  shellHook = "
    export SOURCE_DATE_EPOCH=315532800
  ";
}
