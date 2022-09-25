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
      direnv.enable = true;
      direnv.nix-direnv.enable = true;
      exa.enable = true;
      home-manager.enable = true;
      htop.enable = true;
      jq.enable = true;
      neovim.enable = true;
      pinentry_qt.enable = true;
      python3.enable = true;
      qutebrowser.enable = true;
      ranger.enable = true;
      ripgrep.enable = true;
      starship.enable = true;

      gpg = {
        enable = true;
      };

      gpg-agent = {
        enable = true;
        pinentryFlavor = "qt";
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

        clock24 = true;
        historyLimit = 10000;
        terminal = "screen-256color";
      };

    };
  };
}
