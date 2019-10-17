{ nixpkgs ? import <nixpkgs> {} }:
with nixpkgs.pkgs;
stdenv.mkDerivation {
  name = "pandoc-pdf";
  src = ./.;
  buildInputs = [
    pandoc
    (texlive.combine {
      inherit (texlive) scheme-small;
    })
  ];

  FONTCONFIG_FILE = makeFontsConf { fontDirectories = [ lmodern ]; };

  buildPhase = ''
    pandoc main.ipynb -V geometry:margin=2cm -o output.pdf
  '';

  installPhase = ''
    mkdir -p $out
    cp output.pdf $out
  '';
}
