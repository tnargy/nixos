#!/bin/sh
pushd ~/nixos
sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd
