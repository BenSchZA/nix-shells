with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "dev";
  buildInputs = [
  	purescript
	nodePackages.bower 
	nodePackages.pulp
	nodejs-12_x
  ];
  shellHook = "";
}
