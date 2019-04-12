with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "nix-dev";
    buildInputs = [ patchelf binutils ];
}
