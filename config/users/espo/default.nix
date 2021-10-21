{ config, pkgs, ... }:

{ 
    # xsession stuff
    # home.file = import ./apps/dwm/start.nix;
    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      MOZ_USE_XINPUT2 = "1";
      SDL_VIDEODRIVER = "wayland";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";

      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "sway";
    };    

    xdg = import ./xdg;

    # Settings for services
    services = import ./services { };

    # Settings for programs
    programs = import ./apps pkgs;
    
    # Do not touch
    home.stateVersion = "21.03";
}
