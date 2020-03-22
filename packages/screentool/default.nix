{ python37Packages, curl, xclip, maim, slop }:

let pyPkgs = python37Packages;
in
  pyPkgs.buildPythonPackage rec {
    name = "screentool";
    version = "1";
    propagatedBuildInputs = [pyPkgs.notify2 curl xclip maim slop];
    src = ./screentool.tar.xz;
  }
