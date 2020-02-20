with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "dev";
  buildInputs = [
  	leiningen
	openjdk11
	clojure # Small Clojure interpreter and linter
  ];
}
