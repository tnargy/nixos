{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    newSession = true;
    escapeTime = 10;
    keyMode = "vi";
    extraConfig = ''
      bind-key j command-prompt -p "join pane from:" "join-pane -s '%%'"
      bind-key s command-prompt -p "send pane to:" "join-pane -t '%%'"
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %
      bind r source-file ~/.tmux.conf
    '';
  };
}
