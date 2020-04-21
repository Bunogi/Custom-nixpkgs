{ stdenv, pkgs, rustPlatform, openssl, pkgconfig, glib, cairo }:

rustPlatform.buildRustPackage rec {
  name = "botty-${version}";
  version = "0.1.0";

  buildInputs = with pkgs; [openssl pkgconfig glib cairo];

  src = builtins.fetchGit {
    url = "https://git.bunogi.xyz/disastia/tg";
  };

  cargoSha256 = "1vagq2dv3fqi5zagq16kmx5qda7k6lx0h1jskkrzc1q3gzwqhxyl";

  doCheck = false;
}
