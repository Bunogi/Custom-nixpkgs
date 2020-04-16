{ }:

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  #TODO replace with <nixpkgs> when 20.03 is out
  nixpkgs = import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
    overlays = [ moz_overlay ];
  };
  nightly = nixpkgs.rustChannelOf { date = "2020-04-16"; channel = "nightly"; };
in
with nixpkgs;
  rustPlatform.buildRustPackage.override {
    rustc = nightly.rust;
  } rec {
    name = "monshot-${version}";
    version = "0.1.4";

    src = builtins.fetchGit {
      url = "https://git.bunogi.xyz/bunogi.xyz/monshot";
      rev = "80b74ee52ee10ac2ed61dd712d0a089cbd03c33e";
    };

    cargoSha256 = "0nn4rzhsja5w63pin8sdpypbs7mxpbkxiwa2mhd9ja6haa9ymwaw";

    # builder = ./builder.sh;

    postBuild = ''
    mkdir -p $out/assets
    cp -rf templates static $out/assets/
    '';

    doCheck = false;
  }
