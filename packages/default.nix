{
  self,
  ...
} @ inputs: let
  upkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;

  nodePkgs = upkgs.callPackages ./nodePackages/override.nix {};
in {
  "advcp" = upkgs.callPackage ./advcp {};
  "rofi/unicode" = upkgs.callPackage ./rofi-unicode {};

  "google-chrome" =
    (import inputs.master {
      system = "x86_64-linux";
      config.allowUnfree = true;
      config.google-chrome.enableWideVine = true;
    })
    .google-chrome;

  "switcher" = upkgs.callPackage ./switcher {
    inherit (inputs.nix.packages.x86_64-linux) nix;
    inherit (inputs.home-manager.packages.x86_64-linux) home-manager;
  };

  "alejandra" = inputs.alejandra.defaultPackage.x86_64-linux;
}
