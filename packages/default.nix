{
  self,
  ...
} @ inputs: let
  upkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;

  nodePkgs = upkgs.callPackages ./nodePackages/override.nix {};
in {
}
