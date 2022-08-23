#!/bin/sh
sudo su
nix-env -iA nixos.git
git clone https://github.com/tnargy/nixos
cd nixos
nixos-install --flake .#nixos
reboot
