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
    nixosConfigurations = {
      surface = lib.nixosSystem {
        inherit system;
	modules = [
	  ./system/laptop.nix
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.onyx = {
	      imports = [ ./user/home.nix ];
	    };
	  }
	];
      };
      nixos = lib.nixosSystem {
        inherit system;
	modules = [
	  ./system/desktop.nix
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.onyx = {
	      imports = [ ./user/home.nix ];
	    };
	  }
	];
      };
    };
  };
}
