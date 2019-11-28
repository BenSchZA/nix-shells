{ pkgs ? import <nixpkgs> {}, pythonPackages ? pkgs.python36Packages }:

let kernels = [
      pkgs.jupyter-kernel
      pkgs.gophernotes
    ];

    additionalExtensions = [
      "@jupyterlab/toc"
      "@jupyterlab/fasta-extension"
      "@jupyterlab/geojson-extension"
      "@jupyterlab/katex-extension"
      "@jupyterlab/mathjax3-extension"
      "@jupyterlab/plotly-extension"
      "@jupyterlab/vega2-extension"
      "@jupyterlab/vega3-extension"
      "@jupyterlab/xkcd-extension"
      "jupyterlab-drawio"
      "@jupyterlab/hub-extension"
      "jupyterlab_bokeh"
    ];
in
pkgs.mkShell rec {
  buildInputs = [
    pythonPackages.jupyterlab 
    pkgs.nodejs
    pythonPackages.ipywidgets
    kernels
  ];

  shellHook = ''
    TEMPDIR=$(mktemp -d -p /tmp)
    mkdir -p $TEMPDIR
    cp -r ${pkgs.python36Packages.jupyterlab}/share/jupyter/lab/* $TEMPDIR
    chmod -R 755 $TEMPDIR
    echo "$TEMPDIR is the app directory"

    # kernels
    export JUPYTER_PATH="${pkgs.lib.concatMapStringsSep ":" (p: "${p}/share/jupyter/") kernels}"

# labextensions
${pkgs.stdenv.lib.concatMapStrings
     (s: "jupyter labextension install --no-build --app-dir=$TEMPDIR ${s}; ")
     (pkgs.lib.unique
       ((pkgs.lib.concatMap
           (d: pkgs.lib.attrByPath ["passthru" "jupyterlabExtensions"] [] d)
           buildInputs) ++ additionalExtensions))  }
jupyter lab build --app-dir=$TEMPDIR

# start jupyterlab
jupyter lab --app-dir=$TEMPDIR
  '';
}

