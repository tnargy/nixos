{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    blender
    gimp
    godot
  ];
}
