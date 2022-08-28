{ config, pkgs, lib, ... }:
let
  config = 
    {
      env = {
        "TERM" = "xterm-256color";
      };

      opacity = 1.0;

      window = {
        padding = {
          x = 2;
          y = 2;
        };
      };

      font = {
        size = 10.0;
        # normal = {
        #   family = "FiraCode";
        #   style = "Regular";
        # };
        # bold = {
        #   family = "FiraCode";
        #   style = "Bold";
        # };
        # italic = {
        #   family = "FiraCode";
        #   style = "Italic";
        # };
        # bold_italic = {
        #   family = "FiraCode";
        #   style = "Bold Italic";
        # };
      };

      # Colors (One Darker)
      colors = {
        primary = {
          background = "#1e2127";
          foreground = "#abb2bf";
	};
        normal = {
          black   = "#1e2127";
          red     = "#e06c75";
          green   = "#98c379";
          yellow  = "#d19a66";
          blue    = "#61afef";
          magenta = "#c678dd";
          cyan    = "#56b6c2";
          white   = "#abb2bf";
        };
        bright = {
          black   = "#5c6370";
          red     = "#e06c75";
          green   = "#98c379";
          yellow  = "#d19a66";
          blue    = "#61afef";
          magenta = "#c678dd";
          cyan    = "#56b6c2";
          white   = "#ffffff";
	};
      };

      key_bindings = [
        { key = "V"; mods = "Control|Shift"; action = "Paste"; }
        { key = "C"; mods = "Control|Shift"; action = "Copy"; }
        { key = "Key0"; mods = "Control"; action = "ResetFontSize"; }
        { key = "Equals"; mods = "Control"; action = "IncreaseFontSize"; }
        { key = "Plus"; mods = "Control"; action = "IncreaseFontSize"; }
        { key = "Minus"; mods = "Control"; action = "DecreaseFontSize"; }
      ];
    };
in
{
  programs.alacritty = {
    enable = true;
    settings = config;
  };
}
