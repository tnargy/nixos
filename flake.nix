{
  description = "My System Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    statix.url = "github:nerdypepper/statix";
    nix.url = "github:nixos/nix";
    master.url = "github:nixos/nixpkgs/master";
  };

  outputs = { self, ... } @ inputs : {
    nixosModules = import ./nixos/modules inputs;
    nixosConfigurations = import ./nixos/configurations inputs;

    homeModules = import ./home/modules inputs;
    homeConfigurations = import ./home/configurations inputs;

    packages.x86_64-linux =
      (import ./packages inputs)
      // self.lib.nixosConfigurationsAsPackages.x86_64-linux
      // self.lib.homeConfigurationsAsPackages.x86_64-linux;

    checks.x86_64-linux = import ./checks inputs;

    lib = import ./lib inputs;
  };
}
