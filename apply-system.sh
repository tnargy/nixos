#!/bin/sh
sudo nixos-rebuild switch --flake .#
home-manager switch --flake .#$USER
