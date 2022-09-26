#!/bin/sh
pushd ~/.nixos
sudo nixos-rebuild switch --flake .#
home-manager switch --flake .#$USER@$HOSTNAME
popd
