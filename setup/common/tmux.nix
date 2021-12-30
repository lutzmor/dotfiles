{ config, pkgs, ... }:
{
  programs.tmux.enable = true;
  programs.tmux.extraConfig = ''
    # make sure fish works in tmux
    set -g default-terminal "screen-256color"
    set -sa terminal-overrides ',xterm-256color:RGB'
    # so that escapes register immidiately in vim
    set -sg escape-time 1
    set -g focus-events on
    # mouse support
    set -g mouse on
    # change prefix to C-a
    set -g prefix C-a
    bind C-a send-prefix
    unbind C-b
    # extend scrollback
    set-option -g history-limit 5000
    # vim-like pane resizing
    bind -r C-k resize-pane -U
    bind -r C-j resize-pane -D
    bind -r C-h resize-pane -L
    bind -r C-l resize-pane -R
    # vim-like pane switching
    bind -r k select-pane -U
    bind -r j select-pane -D
    bind -r h select-pane -L
    bind -r l select-pane -R
    # styling
    set -g status-style fg=white,bg=default
    set -g status-left ""
    set -g status-right ""
    set -g status-justify centre
    set -g status-position bottom
    set -g pane-active-border-style bg=default,fg=default
    set -g pane-border-style fg=default
    set -g window-status-current-format "#[fg=cyan]#[fg=black]#[bg=cyan]#I #[bg=brightblack]#[fg=white] #W#[fg=brightblack]#[bg=default] #[bg=default] #[fg=magenta]#[fg=black]#[bg=magenta]λ #[fg=white]#[bg=brightblack] %a %d %b #[fg=magenta]%R#[fg=brightblack]#[bg=default]"
    set -g window-status-format "#[fg=magenta]#[fg=black]#[bg=magenta]#I #[bg=brightblack]#[fg=white] #W#[fg=brightblack]#[bg=default] "
  '';
}
