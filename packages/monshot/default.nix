{ }:

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  #TODO replace with <nixpkgs> when 20.03 is out
  nixpkgs = import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
    overlays = [ moz_overlay ];
  };
  nightly = nixpkgs.rustChannelOf { date = "2020-04-06"; channel = "nightly"; };
in
with nixpkgs;
  rustPlatform.buildRustPackage.override {
    rustc = nightly.rust;
  } rec {
    name = "monshot-${version}";
    version = "0.1.3";

    src = builtins.fetchGit {
      url = "https://git.bunogi.xyz/bunogi.xyz/monshot";
      rev = "80b74ee52ee10ac2ed61dd712d0a089cbd03c33e";
    };

    cargoSha256 = "0454ixc03agify1v377c0nwf60g10pgz6f0gnb49838gb8jwzbcj";

    # builder = ./builder.sh;

    postBuild = ''
    mkdir -p $out/assets
    cp -rf templates static $out/assets/
    '';

    doCheck = false;
  }
