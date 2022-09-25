{
  nixpkgs,
  self,
  ...
}: {pkgs, ...}: {
  config = {
    nixpkgs.allowedUnfree = ["google-chrome"];

    activeProfiles = ["browsing"];

    dconf.enable = true;

    programs.htop = {
      settings = {
        detailed_cpu_time = true;
      };
    };

    xsession.windowManager.awesome.autostart = [
      "${pkgs.blueman}/bin/blueman-applet"
      "${pkgs.networkmanagerapplet}/bin/nm-applet"
    ];
  };
}
