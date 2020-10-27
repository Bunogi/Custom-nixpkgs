{ stdenv, pkgs, rustPlatform, openssl, pkgconfig, glib, cairo }:

rustPlatform.buildRustPackage rec {
  name = "botty-${version}";
  version = "0.1.0";

  nativeBuildInputs = with pkgs; [ pkgconfig ];

  buildInputs = with pkgs; [openssl glib cairo];

  src = builtins.fetchGit {
    url = "https://git.dark.red/bunogi/tg";
  };

  cargoSha256 = "15slyjhi8x6rzybijh06ai22q2c7dpg58bmi5v8mvfi3m6zsh7bc";

  doCheck = false;
}
