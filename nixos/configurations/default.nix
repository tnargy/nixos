{self, ...} @ inputs: {
  nixos = self.lib.mkSystem "nixos" inputs.nixpkgs;
  surface = self.lib.mkSystem "surface" inputs.nixpkgs;
}
