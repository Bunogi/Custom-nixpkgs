with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "volume";
  version = "2";

  buildInputs = [ pamixer dzen2 ];

  src = ./volume.tar.xz;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/bin
    cp volume $out/bin
  '';
  }
