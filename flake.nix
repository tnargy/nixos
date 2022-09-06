{
  description = "My System Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

    lib = nixpkgs.lib;

  in {
    homeConfigurations.onyx = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules =  [ ./user/onyx/home.nix ]; 
    };
    nixosConfigurations = {
      surface = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./system/surface/hardware-configuration.nix
          ./system/surface/default.nix
        ];
      };
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./system/nixos/hardware-configuration.nix
          ./system/nixos/default.nix
        ];
      };
    };
  };
}
