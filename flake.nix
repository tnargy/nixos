{
  description = "My System Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    statix.url = "github:nerdypepper/statix";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    nix.url = "github:nixos/nix";
    master.url = "github:nixos/nixpkgs/master";
  };

  outputs = { self, ... } @ inputs : {
    formatter.x86_64-linux = self.packages.x86_64-linux.alejandra;
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

    devShell.x86_64-linux = self.devShells.x86_64-linux.default;
    devShells.x86_64-linux.default = inputs.nixpkgs.legacyPackages.x86_64-linux.mkShell {
      packages = builtins.attrValues {
        inherit (self.packages.x86_64-linux) nil alejandra;
        inherit (inputs.nixpkgs.legacyPackages.x86_64-linux) openssl pkg-config;
      };
    };
  };
}
