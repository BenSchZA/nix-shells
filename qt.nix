with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "python";
  buildInputs = [ qt5.full qtcreator ];
  shellHook = "";
}
