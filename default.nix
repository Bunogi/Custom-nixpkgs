{
  overlay = self: super: {
    screentool = super.callPackage ./packages/screentool {};
    volume = super.callPackage ./packages/volume {};
    botty = super.callPackage ./packages/botty {};
    monshot = super.callPackage ./packages/monshot {};
    qemu-irix = super.callPackage ./packages/qemu-irix {};
    brightness = super.callPackage ./packages/brightness {};
  };

  services = {
    botty = import ./services/botty;
    monshot = import ./services/monshot;
  };

  config = import ./config;

  sshKeys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4nkyU90FdeM+jhuiRAoKDoUVSukTWobOkrQgiZgojH1zwOppc0Y4Exu1i8o22MIrC9Ef8J74baOccEWbNkvM1f915FGDdkQYjOUCvDC6drZLpAPf5Ps4J50EgjdUjb2t7wSFdMpkUITfAYjvTYiGjTzaXEdXuY6C2VG59m7MiclzrowV3pPnjCZfw9gFBTV3Rz+p69ctVH418jMujIZriHT0HbAIiNwy8GR0cQZPpXBsZflMOHEIXdtUDtAf8b9GLVZ5Bl/mNNfD85Ybf5KDHWPZ8BE+LOTD4GpvQ5OprvdZTn3YkzYl+drb7wIa94ZnNyyxrnIl5g/wljLLMEvVDNusoPx0aKSDtm5Y0hQ6SSQEaafaGyrqRkKyTtkkX1Fx9Pa90taXxoWBK1l/2EGhTU5nG2XdjzT7AOko4nY2iiKzof0OF/nokOVjLEss5UH6IYf8YIzQV9H2YUYqBEbFbtlb23qArhF68NcUDMaN3laUIQ7Y7DcQAYfxVgu8AtyH5AdSpOIGAnYZaICTPVy7O96XE7oPKPFPg+jjm6vEcUwcvZ+ns5+sBayZiTHM5HUDMyQHNH0Ue7vnHeZ+un/QdVERADpLiga/3sQedQiw5xULp4FEJ66jmZQeIGXUPvB3OLkscycWWq9t1neizef9L9xj4Q3ZTG0UB7OE3g6AOmQ== bunogi@zenix"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCtlTW1/iP30h+Ziaz8qq+OQggnyem20cuAWUZPRy2L1YqM1Xpw41ylyoaLxxDJjHSIhjfy6j1Zn43Ms53Xpe7GWk+l/VNr0KwApeU44SvARFqE10/c+0YcrnTEBqhSvChEcjFs/AJ0AEIVB9spi8citf71/KgjGkfd8TvX0nNNUdz26pvjFRf5bjIL6m2zC3dL56GbiflhQ/Ft+UOt6+xRXieYdGkW37X9jzkgcUqKOnKZkXY39t1wZCeh6gMFce7RH9DBcqeyJuuSjNuK8vmx88P3hAyvmzfZmPU63BgKJHV1m54Aha3qyVU2tesw0ZRMlf8jpw0JZY727H13fKPhNM846udn7l/Y1NDA7C635TQY5zsnqBgk7j7flVXZzMTya0zY3FcRxI169M1Fjd56DhFLar46ttKJHNY6RwePVHmJVkb42/Crto3u5/iiQ/D9rbObWXF1nI9OqZOJCtvMZaptwmFQ1Oh7omtH94htOQAZWPYOj/bvxn/2DZhvwkI0H6gM0PpsfBDMDoE3O8P3+B5ZNVZLNnN/rI+mfyJabUbeDuKe3ABWNGmOuT1QcTKxVr57Axo3F8T8fCEWaid76tXK46cXvF+qe7Kw4Il0f/y5FsoXVE50E1TULzEoUNB2pPTh6AlGqYe3DloIwiswzNpkTFUmNnCrenbL5FRbQQ== bunogi@archzen"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkh03TYtENNf2LNxMc5mXgiiIeCOl795Svb6RYmVt3L1Hfv4dfaG44dv1QyskE0GxKviHtf/VuwuzGe1cyaKyAqbR0z1EOOpZGPrB9dTdxPksekk4ouQu2Llppo2pmp7h2eetsHO69lVzZNbFxYVTln/W+PfqJqoxeZqGei0/Zlu0l/Jioe79a76nSZl5R/1+gYw3QZwStjegvcmlqJ4Ip5+AaEO6Qek7woHnt9fNT/tCaYPU/ohNegMIxCvHXTw61tLDD425yYSzdjsfcsSSf2isENw/gEC4vEBAoji0CtdkzFpW/Duyr2vbGtdDHnBreEH39IiMavd2sZ11l9mY7PugHJ/Oe8/QBktucIH3TQHnShzBhZuL5c/dLkFHbMJ2YC7De5RDtrUZLGArGZEzsdj/Wcxx8PaY0TnouECOdOorWSWdyMrpKLornIOPJdM93WY1d/72IfkDugdP70Eu2Tt2za/LSRXfEJqs2Pz6dfKYIOPLUvaRVfFs5dmBwQb1aNmrmLqyTz1faFjerHUYX4j3wIP+2QiH/B+jjRtdCXk9XcHSHVb4qvV4KFQ0cuWTc+AtOO7t5RGpNJqn4lmRVMiCHFQjm+CkPtPHOVFpkvgc56CrQZMUYwNpJ/kexIfbdTX0FvAUQJAY6IaLfC5ddKculcaWv9OxLBLORMdnqaw== Phone"
    ];
}
