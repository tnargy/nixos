{self, ...}: {
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.profiles.base;

  inherit (lib.hm) dag;

in {
  options.profiles.base = {
    enable = lib.mkEnableOption "The base profile, should be always enabled";
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = rec {
      EDITOR = "nvim";
      VISUAL = "nvim";
      GIT_EDITOR = EDITOR;
      PATH = "$PATH:/home/onyx/.nixos/bin";
    };

    programs = {
      advancedCopy.enable = true;
      alacritty.enable = true;
      bat.enable = true;
      eza.enable = true;
      home-manager.enable = true;
      htop.enable = true;
      jq.enable = true;
      neovim.enable = true;
      starship.enable = true;


      gpg = {
        enable = true;
      };

      git = {
        enable = true;
        userName = "onyx";
        userEmail = "clsscmstng@gmail.com";
      };

      ssh = {
        enable = true;
        compression = true;
      };

      tmux = {
        enable = true;
        newSession = true;
        escapeTime = 10;
        keyMode = "vi";
        extraConfig = ''
          bind-key j command-prompt -p "join pane from:" "join-pane -s '%%'"
          bind-key s command-prompt -p "send pane to:" "join-pane -t '%%'"
          bind | split-window -h
          bind - split-window -v
          unbind '"'
          unbind %
          bind r source-file ~/.config/tmux/tmux.conf
        '';
      };
    };

    services = {
      gpg-agent = {
        enable = true;
        pinentryFlavor = "qt";
      };
    };
  };
}
