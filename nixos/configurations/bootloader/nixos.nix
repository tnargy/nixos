{
  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.device = "/dev/sda";
  boot.loader = {
	systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
	efi.efiSysMountPoint = "/boot";
  };
}
