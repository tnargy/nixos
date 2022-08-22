#!/bin/sh
pushd ~/nixos
home-manager switch -f ./user/home.nix
popd
