with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "go";
  buildInputs = [
    go_1_13
    gcc
    git
  ];
  shellHook = "";
}
