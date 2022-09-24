{
  nixpkgs,
  self,
  ...
}: {
  config,
  pkgs,
  lib,
  ...
}: let
  self' = self.packages.x86_64-linux;
in {
  profiles.base.enable = true;
  fonts.fontconfig.enable = true;

  systemd.user = {
    # sessionVariables = { NIX_PATH = nixPath; };
  };

  xsession.windowManager.awesome.enable = true;

  home = {
    # sessionVariables = { NIX_PATH = nixPath; };

    packages = let
      p = pkgs;
      s = self';
    in [
      p.cachix
      p.nix-review
      p.exercism
      p.tmate
      p.element-desktop

      p.fira-code
      p.cascadia-code

      p.lefthook
    ];

    stateVersion = "22.05";
  };
}
