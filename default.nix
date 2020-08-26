{
  overlay = self: super: {
    screentool = super.callPackage ./packages/screentool {};
    volume = super.callPackage ./packages/volume {};
    botty = super.callPackage ./packages/botty {};
    monshot = super.callPackage ./packages/monshot {};
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
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCcjte6dkDrrDmUn/EF+1aYSmazuBVr1ilFdxsqXB0lhtBWZuyUDPHR318pfIebb5L8iTTfwtVSSNESR1/sg68kJkRWXa1dIo/bWMNfRgvvmHDfXRkqUb298wovartP9Lb7GuxntUnfHZcyG2n05ozvnI4JraRk32QYMfGt7U4Qpd5UeEh1LndIicaCo9DRmW6iuMih03B1lRA0JPcXxD/xmq/av36KcHSwDQtiBbnRA11Z66Da57JbVOwIZFY9ttU4opu8C1rsW2RI7AWLcox2+uwzFjcJrAKJjxrKpI5ENKpQ+7vxDsnSBNRolSWblkJ8GqgqVz5m2Z9tVO36s/DcznuuSB7L+IfnETwT8s7h53mKah30tsVLRAH0FthuiPwORN6DwUSz0AdETsmSd9NIidCRM9zAz1WXxLmEdw0mdgZw8WntmvKc7JoHfKPEqij/+oGiidh4Q1wAJhjG7Lw5WmJo/KB25VdxWzB9rcdvS75URkxHijQHFfMAN5Tz75P5x8pMDrtOHr6QzrJLwwBCgGRS2k7BSI8Xv4gRzJoOsMTsKw4c3Z4DHBBQaosfTQ02FUGhoJ1SZcSGx/LkEjM6Q5X6mLhRrIEIpIA7IIl5iwbWMnO4wDJxQsFDPF01QK5tucn+fjdvkUX39Gmkj8rKI/dg5WUe1YyOZ79z59B80Q== bunogi@zenix"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAHHF2aul1KzIh83PR10M4Kr4eJaWVu02ubk556gdFjxys9Jslo6mR+E0IRBWvjYhbSAP6WSGsSbCHWV38kfU5CylcMaV6RT3UH1HDRIqsGPrLAKwM+x8oguPmgx+PovBe6Hz+nbTdj4Ei1dXupZXzmFMDVUfpaPW++LsaZzTsoaHvNRnGGfQvfXeLMJ19+KSFRqIyU7A3M+qcyOs8sazSDxS8EhLbhIjEdDC3UtDxLhHl4wQwbBu0VHfusStin5c4Hffj8kYTY69ZR3JIj3zJ1tsgZ355IQtA31uVi13N/v275v5VvurBu1fe40Crb8dyUp/m/+NsnZBG5YWvK3atPIpLY9HXSeZhSSY4akafmF5eGlYIaDbz78vvmkxG3txKt2bfsfOvbItZlx9sv0Bq9VI+BqQtXpp8mn6QFTc6xJjfhBDsELHVzGyCJmsBILqDhNc898OeNVhKC+fnE78SlxKt85rRuW9ewZCE7X5tUItqyGeEmQkErR3BN0DoxUm3I1Ri4LmXdJ1L5iJv0X0+BcaKuCTbVpCKMm2YClJmGKDljZxMMNr/iGikgqK3r3aQ3L7kasjNGEeLK1gF7V7MJJiOCaDArZb38BMEBc2OxIa994vrlPfm+5BHur9DBJXKY5a0pc2K9BVk8CUjkJDLk1NprKolYrLwCX8r0COvtw== bunogi@fakenix"
    ];
}
