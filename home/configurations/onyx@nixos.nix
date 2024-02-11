{
  nixpkgs,
  self,
  ...
}: {pkgs, ...}: {
  config = {
    nixpkgs.allowedUnfree = ["discord" "google-chrome" "spotify"];

    activeProfiles = ["browsing" "laptop"];

    dconf.enable = true;

    programs.alacritty = {
      settings = {
        font.size = 8;
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

    programs.htop = {
      settings = {
        detailed_cpu_time = true;
      };
    };

    xsession.windowManager.awesome.autostart = [
      "${pkgs.networkmanagerapplet}/bin/nm-applet"
    ];
  };
}
