{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "fhs-env";
  targetPkgs = pkgs: with pkgs; [
  ];
  multiPkgs = pkgs: with pkgs; [
  ];
  runScript = ''$SHELL'';
}).env

