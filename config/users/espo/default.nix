{ config, pkgs, ... }:

{ 
    # xsession stuff
    home.file = import ./apps/dwm/start.nix;    
    xdg.userDirs = import ./apps/xdg/xdg.nix;

    # Settings for services
    services = import ./services { };

    # Settings for programs
    programs = import ./apps pkgs;

    # Do not touch
    home.stateVersion = "21.03";
}
