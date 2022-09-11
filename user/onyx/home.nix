{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "onyx";
  home.homeDirectory = "/home/onyx";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    TERM = "alacritty";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.packages = with pkgs; [
    alacritty
    bat
    gcc
    neovim
    pinentry_qt
    python3
    qutebrowser
    ranger
    ripgrep
  ];

  imports = [
    ./alacritty.nix
    ./tmux.nix
  ];

  programs.bash.enable = true;

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  programs.git = {
    enable = true;
    userName = "onyx";
    userEmail = "clsscmstng@gmail.com";
  };

  home.file = {
    ".config/awesome/rc.lua" = {
      source = ./awesome.lua;
    };
  };
}
