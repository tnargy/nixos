{ config, pkgs, lib, ... }:

let
  config = 
    {
      customRC = ''
      '';

      packages.myVimPackages = with pkgs.vimPlugins; {
        # loaded on launch
	start = [ vim-nix ];
	# manually loadable
	opt = [  ];
      };
    };
in
{
  programs.neovim = {
    enable = true;
    coc.enable = true;
    configure = config;
  };
}
