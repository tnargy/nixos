#!/bin/sh
sudo su
nix-env -iA nixos.git
git clone https://github.com/tnargy/nixos
cd nixos
cp /etc/nixos/hardware-configuration.nix system/
nixos-install --flake .#nixos
reboot
