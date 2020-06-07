{ }:

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> {
    overlays = [ moz_overlay ];
  };
  nightly = nixpkgs.rustChannelOf { date = "2020-06-07"; channel = "nightly"; };
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

    cargoSha256 = "1x85wlx6prjlsynnz9gxkrqfp6pxhs7kwgmli7s22yk3a9fz95k8";
    
    postBuild = ''
      mkdir -p $out/assets
      cp -rf templates static $out/assets/
    '';

    doCheck = false;
  }
