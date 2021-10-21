{ config, pkgs, ... }:

{ 
    xdg.userDirs = {
      enable = true;
      documents = "$HOME/stuff/other/";
      download = "$HOME/stuff/other/";
      videos = "$HOME/stuff/other/";
      music = "$HOME/stuff/music/";
      pictures = "$HOME/stuff/pictures/";
      desktop = "$HOME/stuff/other/";
      publicShare = "$HOME/stuff/other/";
      templates = "$HOME/stuff/other/";
    };

    xdg.configFile = {
     "sway/config".source = ./configs/sway/config;
     "swaylock/config".source = ./configs/swaylock/config;
     "swaynag/config".source = ./configs/swaynag/config;
     "waybar/config.jsonc".source = ./configs/waybar/config.jsonc;
     "waybar/style.css".source = ./configs/waybar/style.css;
     "wofi/config".source = ./configs/wofi/config;
     "wofi/moonfly.css".source = ./configs/wofi/moonfly.css;
     "kanshi/config".source = ./configs/kanshi/config;
     "kitty/kitty.conf".source = ./configs/kitty/kitty.conf;
     "kitty/moonfly.conf".source = ./configs/kitty/moonfly.conf;
     "kitty/ncmpcpp-kitty.conf".source = ./configs/kitty/ncmpcpp-kitty.conf;
     "kitty/unicode-input-favorites.conf".source = ./configs/kitty/unicode-input-favorites.conf;
     "mako/config".source = ./configs/mako/config;
    };
    
    home = import ./home { };

    # Settings for services
    services = import ./services { };

    # Settings for programs
    programs = import ./apps pkgs;
}
