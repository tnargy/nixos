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

    };
    services = {
      gpg-agent = {
        enable = true;
        pinentryFlavor = "qt";
      };
    };
  };
}
