{self, ...} @ inputs: {
  nixos = self.lib.mkSystem "nixos" inputs.nixpkgs;
  geek = self.lib.mkSystem "geek" inputs.nixpkgs;
}
