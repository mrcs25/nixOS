{ pkgs, config, ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv = { enable = true; };
  };

  #programs.thefuck = { enable = true; };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
        REPOS=/home/marcus/github;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "direnv" ];
    };

    shellAliases = {
      ll = "ls -alh";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
