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
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkh03TYtENNf2LNxMc5mXgiiIeCOl795Svb6RYmVt3L1Hfv4dfaG44dv1QyskE0GxKviHtf/VuwuzGe1cyaKyAqbR0z1EOOpZGPrB9dTdxPksekk4ouQu2Llppo2pmp7h2eetsHO69lVzZNbFxYVTln/W+PfqJqoxeZqGei0/Zlu0l/Jioe79a76nSZl5R/1+gYw3QZwStjegvcmlqJ4Ip5+AaEO6Qek7woHnt9fNT/tCaYPU/ohNegMIxCvHXTw61tLDD425yYSzdjsfcsSSf2isENw/gEC4vEBAoji0CtdkzFpW/Duyr2vbGtdDHnBreEH39IiMavd2sZ11l9mY7PugHJ/Oe8/QBktucIH3TQHnShzBhZuL5c/dLkFHbMJ2YC7De5RDtrUZLGArGZEzsdj/Wcxx8PaY0TnouECOdOorWSWdyMrpKLornIOPJdM93WY1d/72IfkDugdP70Eu2Tt2za/LSRXfEJqs2Pz6dfKYIOPLUvaRVfFs5dmBwQb1aNmrmLqyTz1faFjerHUYX4j3wIP+2QiH/B+jjRtdCXk9XcHSHVb4qvV4KFQ0cuWTc+AtOO7t5RGpNJqn4lmRVMiCHFQjm+CkPtPHOVFpkvgc56CrQZMUYwNpJ/kexIfbdTX0FvAUQJAY6IaLfC5ddKculcaWv9OxLBLORMdnqaw== Phone"
	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDaNKQEiSlaSxQvLXyxi2DNiCgOdFhbWt1A/r2QYlOzuCdfzm7MY3fTLUELuemlhogwlcbwgbquiv7Zv0R3uD/meiezLu6VdKYyxs5dTuPL26nxm8c6CTBostti2uv/hbQUjMaRYvXk17Hmp0rMcoQk7ITN6AReAUzsBhTzDFVfgLmcchSXYh2Jmk25tkVkRgXAeK6KZMijkfakfGrvb0z047d40+uKa2mUVli+9DTKHpuISj9KaOWxZ0u73Yh9IAwBKuU9U/vP+Gud9N0jSDzh2vwkYb51lCVSnF6HOt6iux7CD91hqHmnpALmQYt9BKCzO8hZFtrfNX7Bmib/WiOeOnLFks5MdXxMDM1TULv+IzY8ts5KLWS15oqq44MEGLMiBwJ+0z+EK3qPqwrM7ACIysmiLseqaH0FBigQDQz/LVbFs15Li57/mR0CzKumH78mg9Km3N8nRaJwykWIyxPpKb8DnWbZMnigDuG6PvLGMhajYuNO1i5e8v73hnZRwqi0etmzC/O32XL5WNg1sNmTuQ67EeC2sRYAnP8zzdtIi1Bd4M6ZexU53bROgyVASMD9X90L2jv5tBh7x+OtA+Ett2iS23Ia6ENOO+iFPqcIrvuw56KfQWqBWLQknbjS9dekyfphxX/3vxICZY0XOEUQ+3+tMwFDZT/YaQT9uYYozw== bunogi@fakenix"
    ];
}
