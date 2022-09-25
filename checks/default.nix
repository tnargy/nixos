inputs: let
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  apkgs = inputs.alejandra.packages.x86_64-linux;

  callPackage = pkgs.lib.callPackageWith (pkgs // apkgs // {inherit (inputs) self;});
in {
  alejandra = callPackage ./alejandra.nix {};
}
