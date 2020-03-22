{
  overlay = self: super: {
    screentool = super.callPackage ./packages/screentool {};
    volume = super.callPackage ./packages/volume {};
  };

  config = import ./config;
}
