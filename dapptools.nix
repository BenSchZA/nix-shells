with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "dapptools";
  buildInputs = [ dapp seth hevm ethsign solc ];
  shellHook = "";
}
