{self, ...} @ inputs: {
  nixos = self.lib.mkSystem "nixos" inputs.nixpkgs;
}
