{ stdenv, symlinkJoin, dzen2, pamixer }:
# with import <nixpkgs> {};

# let joined = symlinkJoin {
#       name = "volume-joined";
#       paths = [pamixer dzen2];
#     };

let volume = stdenv.mkDerivation {
      name = "volume";
      version = "3";

      src = ./volume.tar.xz;
      dontBuild = true;
      installPhase = ''
          mkdir -p $out/bin
          cp volume $out/bin
        '';
    };
in
  symlinkJoin {
    name = "volume";

    paths = [ dzen2 pamixer volume ];
  }
