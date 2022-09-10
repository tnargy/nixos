{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    blender
    gimp
    godot
    gcc
    python3
    ranger
    ripgrep
  ];
}
