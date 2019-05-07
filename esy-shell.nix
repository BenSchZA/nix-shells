{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "esy-env";
  targetPkgs = pkgs: (with pkgs;
    [ gnum4
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
      ]);
  profile = ''
   export NPM_CONFIG_PREFIX=./vendor/node_modules
   export PATH=$PWD/vendor/node_modules/bin:$PATH
  '';
}).env

