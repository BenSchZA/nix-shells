with import <nixpkgs> { };
mkShell {
  buildInputs = [ nodejs-10_x opam dune m4 ]
    ++ (with ocamlPackages; [ ocaml ocamlbuild findlib ninja merlin ]);
  shellHook = ''
    #export PATH="`pwd`/node_modules/.bin:$PATH"
    eval $(opam env)
  '';
}
