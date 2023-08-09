{self, ...} @ inputs: name: nixpkgs:
nixpkgs.lib.nixosSystem (
  let
    inherit (builtins) attrValues;

    configFolder = "${self}/nixos/configurations";
    entryPoint = import "${configFolder}/${name}.nix" inputs;
    bootloader = "${configFolder}/bootloader/${name}.nix";
    hardware = "${configFolder}/hardware/${name}.nix";
  in {
    system = "x86_64-linux";

    modules =
      [
        {
          boot.tmp.cleanOnBoot = true;
          networking.hostName = name;
          nix.flakes.enable = true;
          system.configurationRevision = self.rev or "dirty";
          documentation.man = {
            enable = true;
            generateCaches = true;
          };
        }
        entryPoint
        bootloader
        hardware
      ]
      ++ attrValues self.nixosModules;
  }
)
