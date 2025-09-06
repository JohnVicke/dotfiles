{ config, pkgs, ... }:

{
  home.username = "johnvicke";
  home.homeDirectory = "/home/johnvicke";
  xdg.configHome = "/home/johnvicke/.config/";
  home.stateVersion = "25.05";

  imports = [ 
    ./git/git.nix 
    ./hyprland/hyprland.nix 
    ./waybar/waybar.nix
    ./zsh/zsh.nix
    ./tmux/tmux.nix
  ];

  fonts.fontconfig.enable = true;


  home.packages = with pkgs; [
    nerd-fonts.fira-code
      btop
      fastfetch
      curl
      fd
      eza
      ripgrep
      bat
      unzip
      docker
      docker-compose
  ];

  services = {
    hyprsunset = {
      enable = true;
    };
  };

  programs = {
    home-manager = {enable = true; };
    fastfetch = {enable = true; };
    fuzzel = {
      enable = true;
    };
    hyprlock = {
      enable = true;
      settings = {
        auth = {
          "fingerprint:enabled" = true;
        };
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };
    ghostty = { 
      enable = true; 
      settings = {
        theme = "rose-pine";
        font-family = "FiraCode Nerd Font";
        background-opacity = 0.8;
      };
      enableZshIntegration = true;
    };
    neovim = { enable = true; };
    gh = {
      enable = true;
      settings = {
        aliases = { co = "pr checkout"; };
        git_protocol = "ssh";
      };
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
  };
}
