with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "network";
	buildInputs = [
		dnsutils 
		nmap 
		bettercap 
		wireshark
		radare2
		radare2-cutter
                urlwatch
                tcpflow
	];
	shellHook = ''
	'';
}
