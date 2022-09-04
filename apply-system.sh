#!/bin/sh
cp /etc/nixos/hardware-configuration.nix ./system/
sudo nixos-rebuild switch --flake .#
