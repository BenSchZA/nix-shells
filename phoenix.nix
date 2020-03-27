{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;

  elixir = beam.packages.erlangR22.elixir_1_9;
  nodejs = nodejs-12_x;
  postgresql = postgresql_10;
in

mkShell {
  buildInputs = [ elixir nodejs yarn git postgresql ]
    ++ optional stdenv.isLinux inotify-tools # For file_system on Linux.
    ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
      # For file_system on macOS.
      CoreFoundation
      CoreServices
    ]);

    shellHook = ''
      export PGDATA="$PWD/db"

      setup() {
        mix local.hex
        mix archive.install hex phx_new 1.4.10
        mix ecto.create
      }

      help () {
        echo 'Setup new environment: setup'
        echo 'Create new app: mix phx.new app'
        echo 'Start server: mix phx.server'
      }
    '';
}
