{self, ...} @ inputs: {
  "onyx@nixos" = self.lib.mkHome "onyx" "nixos" "x86_64-linux" inputs.nixpkgs;
  "onyx@surface" = self.lib.mkHome "onyx" "surface" "x86_64-linux" inputs.nixpkgs;
}
