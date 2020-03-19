with import <nixpkgs> {};

let deps = [dzen2 pamixer bash];
in
  stdenv.mkDerivation rec {
    name = "volume";
    version = "1";

    propagatedBuildInputs = deps;
    src = ./volume.tar.xz;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/bin
      cp volume $out/bin
    '';
  }
