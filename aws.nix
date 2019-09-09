with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "aws";
  buildInputs = [ awscli aws-iam-authenticator ];
  shellHook = "";
}
