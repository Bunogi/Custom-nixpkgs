{ }:

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  #TODO replace with <nixpkgs> when 20.03 is out
  nixpkgs = import <nixpkgs> {
    overlays = [ moz_overlay ];
  };
  nightly = nixpkgs.rustChannelOf { date = "2020-04-21"; channel = "nightly"; };
in
with nixpkgs;
  rustPlatform.buildRustPackage.override {
    rustc = nightly.rust;
  } rec {
    name = "monshot-${version}";
    version = "0.1.4";

    src = builtins.fetchGit {
      url = "https://git.bunogi.xyz/bunogi.xyz/monshot";
    };

    cargoSha256 = "062dpnfhzfaz53cg9cfmlza77nkn8qz6kgkpachb2krs1gv173h1";

    postBuild = ''
      mkdir -p $out/assets
      cp -rf templates static $out/assets/
    '';

    doCheck = false;
  }
