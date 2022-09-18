#!/bin/sh
pushd ~/nixos
git pull
nix flake update --commit-lock-file
popd
