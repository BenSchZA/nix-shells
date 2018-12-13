with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "dapptools";
	buildInputs = [
		dnsutils nmap bettercap wireshark
	];
	shellHook = ''
	'';
}
