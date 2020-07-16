{ }:

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> {
    overlays = [ moz_overlay ];
  };
  nightly = nixpkgs.rustChannelOf { date = "2020-07-16"; channel = "nightly"; };
in
with nixpkgs;
  rustPlatform.buildRustPackage.override {
    rustc = nightly.rust;
  } rec {
    name = "monshot-${version}";
    version = "0.1.4";

    src = builtins.fetchGit {
      url = "https://git.dark.red/bunogi/monshot";
    };

    cargoSha256 = "1g60inam68jbj46n8qz2flawjq52c1lrcfyq7ssixz9ir5dmb4pb";
    
    postBuild = ''
      mkdir -p $out/assets
      cp -rf templates static $out/assets/
    '';

    doCheck = false;
  }
