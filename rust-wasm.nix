# See https://gist.github.com/LightDiscord/aa8cb8e67ec9efbf9b20a9a3e9ebd007

#$ # Then you can run any cargo-web command. (You need to specify the target)
#$ cargo-web build --target=wasm32-unknown-unknown
#$ cargo-web start --target=wasm32-unknown-unknown
#$ cargo-web deploy --target=wasm32-unknown-unknown

with import <nixpkgs> {
  overlays = map (uri: import (fetchTarball uri))
    [ "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz" ];
};

stdenv.mkDerivation {
  name = "rust-wasm";
  buildInputs = [
    cargo-web
    (latest.rustChannels.nightly.rust.override {
      targets = [ "wasm32-unknown-unknown" ];
    })
  ];
}
