#!/bin/sh
git pull
nix flake update --commit-lock-file
