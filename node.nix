with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "node";
  buildInputs = [ nodejs-10_x yarn ];
  shellHook = ''
    alias yarn="yarn --registry http://localhost:8081/repository/npm-proxy --ignore-engines"
    alias yarn-remote="yarn --ignore-engines"
    alias registry-proxy="npm config set registry http://localhost:8081/repository/npm-proxy && yarn config set registry http://localhost:8081/repository/npm-proxy"
    alias registry-remote="npm config set registry https://registry.npmjs.org && yarn config set registry https://registry.yarnpkg.com"
          export PATH="$PWD/node_modules/.bin/:$PATH"
    npm config set cache-min 9999999
    echo "Command yarn by default uses local Nexus proxy ~ use yarn-remote to use remote registry"
    registry-remote
  '';
}
