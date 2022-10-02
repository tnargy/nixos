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
      bat.enable = true;
      direnv.enable = true;
      direnv.nix-direnv.enable = true;
      exa.enable = true;
      home-manager.enable = true;
      htop.enable = true;
      jq.enable = true;
      neovim.enable = true;
      starship.enable = true;

      alacritty = {
        enable = true;
        settings = {
          font.size = 12;
          colors = {
            primary = {
              background = "0x282828";
              foreground = "0xdfbf8e";
            };

            normal = {
              black=   "0x665c54";
              red=     "0xea6962";
              green=   "0xa9b665";
              yellow=  "0xe78a4e";
              blue=    "0x7daea3";
              magenta= "0xd3869b";
              cyan=    "0x89b482";
              white=   "0xdfbf8e";
            };

            bright = {
              black=   "0x928374";
              red=     "0xea6962";
              green=   "0xa9b665";
              yellow=  "0xe3a84e";
              blue=    "0x7daea3";
              magenta= "0xd3869b";
              cyan=    "0x89b482";
              white=   "0xdfbf8e";
            };
          };
        };
      };

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
