inputs: {
  cachix = import ./cachix inputs;
  flake = import ./flake.nix inputs;
  nix = import ./nix.nix inputs;
}
