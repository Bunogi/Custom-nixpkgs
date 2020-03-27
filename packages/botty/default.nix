{ stdenv, rustPlatform, openssl, pkgconfig, glib, cairo}:

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> {
    overlays = [ moz_overlay ];
  };
in
  with nixpkgs;
  rustPlatform.buildRustPackage.override {
    rustc =
      assert lib.strings.versionAtLeast (lib.strings.getVersion nixpkgs.latest.rustChannels.stable.rust) "1.39.0";
      nixpkgs.latest.rustChannels.stable.rust;

  } rec {
    name = "botty-${version}";
    version = "0.1.0";

    buildInputs = [openssl pkgconfig glib cairo];

    src = builtins.fetchGit {
      url = "https://git.bunogi.xyz/disastia/tg";
    };

    cargoSha256 = "1ivffxr3srb9ny0g8za2nhgakcg2kk45cflwpjbr273qs6npb2q0";

    # builder = ./builder.sh;

    doCheck = false;
  }
