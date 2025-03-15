{ pkgs, config, ... }: {
  programs.git = {
    enable = true;
    userName = "mrcs25";
    lfs.enable = true;
    aliases = {
      co = "checkout";
      br = "branch";
      unstage = "reset HEAD --";
      up = "fetch --prune --all";
      graph = "log --oneline --graph --decorate";
      fpush = "push --force-with-lease";
      mr =
        "push --push-option=merge_request.create --push-option=merge_request.draft";
      fix = "commit -p --amend --no-edit";
    };
    extraConfig = {
      core.editor = "vim";
      core.eol = "lf";
      core.autocrlf = false;
      merge.ff = "only";
      pull.ff = "only";
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };
}
