{ pkgs, config, ... }:

let
  hostColor = {
    "zenix" = "yellow";
    "bunogi.xyz" = "green";
  }.${config.networking.hostName};
in
{
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = [pkgs.fzf];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    interactiveShellInit = builtins.replaceStrings [ "__FZF__" ] [ (toString pkgs.fzf) ] (
      builtins.readFile ./interactive.zsh
    );

    promptInit = builtins.replaceStrings ["__HOST_COLOR__"] [ (toString hostColor)]
      (builtins.readFile ./prompt-init.zsh);

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
