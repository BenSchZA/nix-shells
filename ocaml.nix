with import <nixpkgs> {};
mkShell {
  buildInputs = [ nodejs-10_x ] ++ (with ocamlPackages_latest; [ ocaml ninja merlin ]);
  shellHook = ''
    #export PATH="`pwd`/node_modules/.bin:$PATH"
  '';
}
