{
  description = "My System Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    statix.url = "github:nerdypepper/statix";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
  };

  outputs = { self, ... } @ inputs : {
    formatter.x86_64-linux = self.packages.x86_64-linux.alejandra;
    nixosModules = import ./nixos/modules inputs;
    nixosConfigurations = import ./nixos/configurations inputs;

    homeConfigurations.onyx = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules =  [ ./user/onyx/home.nix ]; 
    };
  };
}
