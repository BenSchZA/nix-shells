{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;

  # elixir = beam.packages.erlangR22.elixir_1_9;

  erlang_wx = erlangR22.override {
    wxSupport = true;
  };

  elixir = (beam.packagesWith erlang_wx).elixir.override {
    version = "1.9.2";
    rev = "ffe7a577cc80f37381dc289c820842d346002364";
    sha256 = "19yn6nx6r627f5zbyc7ckgr96d6b45sgwx95n2gp2imqwqvpj8wc";
  };
in

mkShell {
  buildInputs = [ erlang_wx elixir ]
    ++ optionals stdenv.isLinux [ inotify-tools wxGTK ] # For file_system on Linux.
    ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
      # For file_system on macOS.
      CoreFoundation
      CoreServices
      wxmac
    ]);

    shellHook = ''
      help () {
        echo 'See https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html'
        echo 'Create new module: mix new example_project --module ExampleModule'
        echo 'mix compile'
        echo 'mix test'
        echo 'mix format --check-formatted'
        echo 'iex -S mix'
      }
    '';
}
