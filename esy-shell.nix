{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "esy-env";
  targetPkgs = pkgs:
    (with pkgs; [
      ocamlPackages.fontconfig
      fontconfig
      gnum4
      perl # for shasum
      binutils
      gcc
      gnumake
      curl
      nodejs
      git
      neovim
      which
      patch
      fontconfig.dev
      fontconfig.lib
      harfbuzz
      ragel
      bzip2
    ]);
  runScript = "bash";
}).env


