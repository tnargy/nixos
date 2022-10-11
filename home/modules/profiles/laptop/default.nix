{self, ...}: {
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.profiles.laptop;
  battery-widget = pkgs.fetchFromGitHub {
    owner = "deficient";
    repo = "battery-widget";
    rev = "25b7e94a34ed854697d61e3cbb0a3ebd9745dbd4";
    sha256 = "sha256-cdqvPyDL3TW0mJugXQuwPkCqf6474M/wka6jWi7IevI=";
  };
in {
  options.profiles.laptop = {
    enable =
      lib.mkEnableOption
      "A profile that enables discord and spotify";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [discord spotify-unwrapped];
    home.file = {
      ".config/awesome/battery-widget".source = "${battery-widget}";
    };
  };
}
