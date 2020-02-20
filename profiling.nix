with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "profiling";
  buildInputs = [ bench valgrind hotspot linuxPackages.perf perf-tools valkyrie ];
  shellHook = ''
    echo "valgrind --tool=massif --pages-as-heap=yes --massif-out-file=massif.out _"
  '';
}
