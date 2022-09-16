{ config, pkgs, systemName, ... }:

{
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.05";

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

