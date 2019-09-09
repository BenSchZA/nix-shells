with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "dev-environment"; # Probably put a more meaningful name here
  buildInputs = [ pkgconfig zlib libpng.dev pngquant ];
}
