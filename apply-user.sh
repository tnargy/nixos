#!/bin/sh
pushd ~/nixos
nix build .#homeManagerConfiguratins.onyx.activationPackage
./result/activate
popd
