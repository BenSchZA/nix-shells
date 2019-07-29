with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "profiling";
  buildInputs = [
    valgrind
  ];
  shellHook = ''
    echo "valgrind --tool=massif --pages-as-heap=yes --massif-out-file=massif.out _"
  '';
}
