{self, ...}: {
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.profiles.base;
  nvimEditor = pkgs.fetchFromGitHub {
  	owner = "tnargy";
	repo = "nvimEditor";
	rev = "ad07980783ccef117eba4dc9682baff1220d4ea3";
	sha256 = "sha256-x8xZfu6uELQJsOkM11F0kj80QZZw7jbpgV+D4a59M4Q=";
  };

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
      alacritty.enable = true;
      bat.enable = true;
      eza.enable = true;
      htop.enable = true;
      jq.enable = true;
      neovim.enable = true;
      starship.enable = true;
      zoxide.enable = true;


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

    #NeoVim
    home.file = {
	".config/nvim".source = "${nvimEditor}";
    };

    services = {
      gpg-agent = {
        enable = true;
        pinentryFlavor = "qt";
      };
    };
  };
}
