{
  overlay = self: super: {
    screentool = super.callPackage ./packages/screentool {};
    volume = super.callPackage ./packages/volume {};
    emacs = super.emacsPackages.emacsWithPackages (em: (with em;
      [ pdf-tools ]
    ));
    botty = super.callPackage ./packages/botty {};
    monshot = super.callPackage ./packages/monshot {};
  };

  services = {
    botty = import ./services/botty;
    monshot = import ./services/monshot;
  };

  config = import ./config;

  sshKeys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4nkyU90FdeM+jhuiRAoKDoUVSukTWobOkrQgiZgojH1zwOppc0Y4Exu1i8o22MIrC9Ef8J74baOccEWbNkvM1f915FGDdkQYjOUCvDC6drZLpAPf5Ps4J50EgjdUjb2t7wSFdMpkUITfAYjvTYiGjTzaXEdXuY6C2VG59m7MiclzrowV3pPnjCZfw9gFBTV3Rz+p69ctVH418jMujIZriHT0HbAIiNwy8GR0cQZPpXBsZflMOHEIXdtUDtAf8b9GLVZ5Bl/mNNfD85Ybf5KDHWPZ8BE+LOTD4GpvQ5OprvdZTn3YkzYl+drb7wIa94ZnNyyxrnIl5g/wljLLMEvVDNusoPx0aKSDtm5Y0hQ6SSQEaafaGyrqRkKyTtkkX1Fx9Pa90taXxoWBK1l/2EGhTU5nG2XdjzT7AOko4nY2iiKzof0OF/nokOVjLEss5UH6IYf8YIzQV9H2YUYqBEbFbtlb23qArhF68NcUDMaN3laUIQ7Y7DcQAYfxVgu8AtyH5AdSpOIGAnYZaICTPVy7O96XE7oPKPFPg+jjm6vEcUwcvZ+ns5+sBayZiTHM5HUDMyQHNH0Ue7vnHeZ+un/QdVERADpLiga/3sQedQiw5xULp4FEJ66jmZQeIGXUPvB3OLkscycWWq9t1neizef9L9xj4Q3ZTG0UB7OE3g6AOmQ== bunogi@zenix"
    ];
}
