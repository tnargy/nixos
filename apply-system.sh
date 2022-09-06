#!/bin/sh
sudo nixos-rebuild switch --flake .#
./apply-user.sh
