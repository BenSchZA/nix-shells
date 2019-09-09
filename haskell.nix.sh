#!/usr/bin/env nix-shell
#!nix-shell -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [lens])" -i runhaskell
main = print [1, 3..]
