with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "node-build";
  buildInputs = [
    nodejs-8_x
    yarn
    pkgconfig
    autoconf
    automake
    libudev
    libtool
    libusb
    nasm
    autogen
    zlib
    nodePackages_8_x.node-gyp
    nodePackages_8_x.node-gyp-build
    nodePackages_8_x.node-pre-gyp
  ];
  shellHook = "";
}
