with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "aragon";
  buildInputs = [
    nodejs-10_x
    nodePackages_10_x.node-gyp 
    nodePackages_10_x.node-gyp-build 
    nodePackages_10_x.node-pre-gyp
    python27
    python27Packages.pip
    python27Packages.setuptools
    yarn
    git
  ];
  shellHook = ''
    npm install -g @aragon/cli
    aragon --version
    create-aragon-app --version
  '';
}
