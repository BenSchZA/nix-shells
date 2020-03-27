# This is a WIP!

{ }:

let
  pkgs = import <nixpkgs> { };
  flutterTestPkgs = (import (builtins.fetchTarball
    "https://github.com/babariviere/nixpkgs/archive/flutter-testing.tar.gz")
    { });
  dartPkgs = (import (builtins.fetchTarball
    "https://github.com/GRBurst/nixpkgs/archive/dart.tar.gz") { });
  flutterVersion = "1.12.13+hotfix.8";
in pkgs.stdenv.mkDerivation {
  name = "flutter";
  buildInputs = with pkgs; [
    flutterTestPkgs.flutterPackages.dev
    dartPkgs.dart
    android-studio
    git
  ];
  shellHook = ''
    echo -e "Path to the Flutter SDK to enter in android-studio:"
    #echo -e "\e[0;34m${flutterVersion}\e[m"
    echo -e "It is advised to add \e[1;34mprograms.adb.enable = true;\e[m to your nix configuration"
    echo -e "Furthermore, add your user to the \e[1;34madbusers\e[m group."
    flutter-dev doctor
  '';
}
