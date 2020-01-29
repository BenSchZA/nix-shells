with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "dev";
  buildInputs = [
  	scala
	openjdk11
  	sbt
  ];
  shellHook = ''
  	echo "Run 'help' for more info";
  	help() {
  		echo "Ensure option programs.java.enable is set if using NixOS";
		echo "Run sbt to enter shell:";
		echo "> console - Scala interpreter/REPL";
		echo "> compile";
		echo "> test";
		echo "> run";
		echo "> submit <email> <id>";
		echo "OR > sbt \"submit <email> <id>\"";
	}
	sbt about;
  '';
}
