{ ghc }:
with (import <nixpkgs> {});

haskell.lib.buildStackProject {
  inherit ghc;
  name = "haskell-default";
  buildInputs = [ glpk pcre ];
}

## stack.yaml
# nix:
# 	enable: true
#	shell-file: shell.nix
