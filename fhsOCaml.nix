with import <nixpkgs> { };

(pkgs.buildFHSUserEnv {
  name = "ocaml-env";
  targetPkgs = pkgs: (with pkgs;
    [
        coreutils patch nodejs-10_x opam dune m4
    ]) ++ (with pkgs.ocamlPackages; [ ocaml ocamlbuild findlib ninja merlin ]);
  multiPkgs = pkgs: (with pkgs;
    [
    ]);
  extraBuildCommands = ''
    mkdir -p $out/opam
  '';
  extraInstallCommands = ''
    opam install opium --destdir $out/opam --yes
  '';
  runScript = "bash";
}).env