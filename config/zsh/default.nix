{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;

    interactiveShellInit = builtins.readFile ./interactive.zsh;
    promptInit = builtins.readFile ./prompt-init.zsh;
    shellInit = ''
      # disable newuser setup
      zsh-newuser-install() {:;}
    '';

    shellAliases = {
      ls = "ls --color=auto -F --si";
      grep = "grep --color=auto";
    };

    syntaxHighlighting.enable = true;
    syntaxHighlighting.highlighters = ["main" "brackets" "cursor"];
    autosuggestions.enable = true;
    histSize = 100000;
  };
}
