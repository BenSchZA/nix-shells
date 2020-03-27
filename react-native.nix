{ pkgs ? import <nixpkgs> { config.android_sdk.accept_license = true; } }:
with pkgs; mkShell {
  ANDROID_HOME = "${androidsdk_9_0}/libexec";

  nativeBuildInputs = [
    androidsdk_9_0
    jdk
    nodejs-10_x
    nodePackages_10_x.react-native-cli
    yarn
  ];

  shellHook = ''
    echo 'Try `help`'
    start() {
      react-native start & wait 5 && react-native run-android
    }
    help() {
      echo '> react-native init example'
      echo '> react-native start'
      echo '> react-native run-android'
      echo '> start'
    }
  '';
}
