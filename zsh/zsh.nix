{ lib, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      initContent = lib.mkMerge [
        (lib.mkOrder 500 ''
         # Early initialization, e.g. setting variables
         export FZF_CTRL_T_COMMAND=""
         '')
        (lib.mkOrder 1500 ''
         # Late initialization
         zvm_after_init() {
           bindkey '^R' fzf-history-widget
         }
         '')
      ];
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; }
          { name = "jeffreytse/zsh-vi-mode"; }
          { name = "zsh-users/zsh-syntax-highlighting"; }
        ];
      };
      shellAliases = {
        cat   = "bat";
        find  = "fd";
        grep  = "rg";
        ls    = "exa";
        t     = "tmux";
        v     = "nvim";
      } // builtins.listToAttrs (
      map (i: {
          name = builtins.concatStringsSep "" (builtins.genList (_: ".") i);
          value = "cd " + (builtins.concatStringsSep "/" (builtins.genList (_: "..") i));
          }) (builtins.genList (x: x + 2) 5)
      );
    };
  };
}
