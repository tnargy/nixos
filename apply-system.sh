#!/bin/sh
sudo nixos-rebuild switch --flake .#
exec apply-user.sh
