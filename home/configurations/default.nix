{self, ...} @ inputs: {
  "onyx@nixos" = self.lib.mkHome "onyx" "nixos" "x86_64-linux" inputs.nixpkgs;
}
