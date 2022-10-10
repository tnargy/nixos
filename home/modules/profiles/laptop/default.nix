{self, ...}: {
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.profiles.laptop;
in {
  options.profiles.laptop = {
    enable =
      lib.mkEnableOption
      "A profile that enables discord and spotify";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [discord spotify-unwrapped];
  };
}
