{ ghc ? null }:
with (import <nixpkgs> { });

haskell.lib.buildStackProject {
  ghc = if isNull ghc then haskell.compiler.ghc881 else ghc;
  extraArgs = "--system-ghc";
  name = "haskell-default";
  buildInputs = [ glpk pcre ];
}

## stack.yaml
# nix:
# 	enable: true
#	shell-file: shell.nix
