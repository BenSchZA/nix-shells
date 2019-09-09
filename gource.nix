with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "dev";
  buildInputs = [
    gource
    libav
    ffmpeg
  ];
  shellHook = ''
    gource \
      -s .06 \
      -1280x720 \
      --auto-skip-seconds .1 \
      --multi-sampling \
      --stop-at-end \
      --key \
      --highlight-users \
      --hide mouse,progress \
      --file-idle-time 0 \
      --max-files 0  \
      --background-colour 000000 \
      --font-size 22 \
      --title "Git Development" \
      --output-ppm-stream - \
      --output-framerate 30 \
      | avconv -y -r 30 -f image2pipe -vcodec ppm -i - -b 65536K gource.mp4
    ffmpeg -i gource.mp4 -b 1000000 gource-downsized.mp4
  '';
}
