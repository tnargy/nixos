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

    xdg.configFile."awesome/battery-widget".source = builtins.fetchFromGitHub {
      owner = "deficient";
      repo = "battery-widget";
      rev = "25b7e94a34ed854697d61e3cbb0a3ebd9745dbd4";
      sha256 = "";
    };
  };
}
