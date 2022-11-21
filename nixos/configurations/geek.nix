# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{nixpkgs, ...} @ inputs: {
  config,
  pkgs,
  lib,
  ...
}: let
  upkgs = nixpkgs.legacyPackages.x86_64-linux;
in {
  networking.networkmanager.enable = true; 
  networking.hostName = "geek";

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Enable sound.
  sound.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.onyx = {
    isNormalUser = true;
    initialPassword = "Password1";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # List packages installed in system profile. To search, run:
  environment.pathsToLink = [ "/libexec" ];
  environment.systemPackages = with pkgs; [
    cachix
    git
    git-crypt
    gnupg
    picom
    tmux
    vim
    wget
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
  ];

  # List services that you want to enable:
  security.rtkit.enable = true;
  services = {
    autorandr.enable = true;
    openssh.enable = true;
    picom = {
      enable = true;
      inactiveOpacity = 0.6;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    xserver = {
      enable = true;
      layout = "us";

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        sddm.enable = true;
        defaultSession = "none+awesome";
        autoLogin.enable = true;
        autoLogin.user = "onyx";
      };

      libinput = {
      	enable = true;
	mouse.accelProfile = "flat";
	touchpad.accelProfile = "flat";
      };

      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [ 
          luarocks # is the package manager for Lua modules 
          luadbi-mysql # Database abstraction layer 
        ];
      };
    };
  };

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  security.sudo.extraRules = [
    {
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = ["NOPASSWD"];
        }
      ];
      groups = ["wheel"];
    }
  ];

  system.stateVersion = "22.05"; # Did you read the comment?
}
