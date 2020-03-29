{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;

  erlang_wx = erlangR22.override {
    wxSupport = true;
  };

  elixir = (beam.packagesWith erlang_wx).elixir.override {
    version = "1.9.2";
    rev = "ffe7a577cc80f37381dc289c820842d346002364";
    sha256 = "19yn6nx6r627f5zbyc7ckgr96d6b45sgwx95n2gp2imqwqvpj8wc";
  };

  fwup = pkgs.callPackage ./derivations/fwup/default.nix { };
in

mkShell {
  buildInputs = [
    erlang_wx 
    elixir

    pkg-config
    automake
    autoconf
    git
    squashfsTools
    ncurses5.dev
    bc
    m4
    unzip
    cmake
    python38
    fwup
  ]
    ++ optionals stdenv.isLinux [ inotify-tools wxGTK ] # For file_system on Linux.
    ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
      # For file_system on macOS.
      CoreFoundation
      CoreServices
      wxmac
    ]);

  # This hook is needed on Linux to make Nerves use the correct ssh_askpass.
  shellHooks = optional stdenv.isLinux ''
    export SUDO_ASKPASS=${x11_ssh_askpass}/libexec/x11-ssh-askpass

    setup() {
      mix local.hex
      mix local.rebar
      mix archive.install hex nerves_bootstrap
    }

    echo 'Try `help` for options'
    help() {
      echo 'Setup new environment: > setup'
      echo '> mix nerves.new hello_nerves'
      echo '> MIX_TARGET=bbb mix deps.get && mix firmware'
    }
  '';
}
