with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "kdenlive";
  buildInputs = [ kdenlive ffmpeg frei0r ];
  shellHook = ''
    kdenlive &
  '';
}
