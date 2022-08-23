#!/bin/sh
pushd ~/nixos
nix build .#homeManagerConfigurations.onyx.activationPackage
./result/activate
popd
