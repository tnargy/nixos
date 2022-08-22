{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  system.stateVersion = "22.05";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true; 

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
    dmenu
    git
    git-crypt
    gnupg
    tmux
    vim
    wget
  ];

  # List services that you want to enable:
  security.rtkit.enable = true;
  services = {
    autorandr.enable = true;
    openssh.enable = true;

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
    enable = false;
    allowedTCPPorts = [ 22 ];
  };

  system.autoUpgrade.enable = true;

}

