{
  overlay = self: super: {
    screentool = super.callPackage ./packages/screentool {};
    volume = super.callPackage ./packages/volume {};
    emacs = super.emacsPackages.emacsWithPackages (em: (with em;
      [ pdf-tools ]
    ));
  };

  config = import ./config;
}
