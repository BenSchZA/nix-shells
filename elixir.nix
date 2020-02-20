{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;

  elixir = beam.packages.erlangR22.elixir_1_9;
in

mkShell {
  buildInputs = [ elixir ]
    ++ optional stdenv.isLinux inotify-tools # For file_system on Linux.
    ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
      # For file_system on macOS.
      CoreFoundation
      CoreServices
    ]);

    shellHook = ''
      help () {
      	echo "mix new _ --module _"
      	echo "mix compile"
	echo "mix test"
      	echo "mix format --check-formatted"
	echo "iex -S mix"
      }
    '';
}
