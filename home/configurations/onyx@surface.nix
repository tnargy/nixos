{
  nixpkgs,
  self,
  ...
}: {pkgs, ...}: {
  config = {
    nixpkgs.allowedUnfree = ["discord" "google-chrome" "spotify-unwrapped"];

    activeProfiles = ["browsing" "laptop"];

    dconf.enable = true;

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
