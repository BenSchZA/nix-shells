with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "octopus";
  buildInputs =
    [ python37 python37Packages.pip python37Packages.setuptools graphviz ];
  shellHook = ''
    pip3.7 install octopus --user            
  '';
}
