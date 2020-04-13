{ stdenv, pkgs, fetchFromGitHub,
  zlib, glib, python, pkgconfig, pixman }:

stdenv.mkDerivation rec {
  version = "irixxxx";
  name = "qemu-${version}";

  src = fetchFromGitHub {
    owner = "n64decomp";
    repo = "qemu-irix";
    rev = "6d7d1fde2f68adf795e51a19ad2572a48931884e";
    sha256 = "1lrd52lmwdv3l3ka071gr1q81zy67g91bh2qk2aqaxrm7prxiaa2";
  };

  buildInputs = [
    zlib glib python pkgconfig pixman
  ];
  enableParallelBuilding = true;

  configureFlags = [
    "--target-list=irix-linux-user,irixn32-linux-user,irix64-linux-user,solaris-linux-user"
  ];
}
