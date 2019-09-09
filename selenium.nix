with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "selenium";
  buildInputs =
    [ python37 python37Packages.pip python37Packages.setuptools geckodriver ];
  shellHook = "";
}
