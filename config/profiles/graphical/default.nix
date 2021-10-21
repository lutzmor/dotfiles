{ pkgs, config, lib, ... }:

{
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaylock-effects
      swayidle
      xwayland
      waybar
      mako
      kanshi
      wofi
      wdisplays
    ];
    wrapperFeatures = {
        base = true; # this is the default, but be explicit for now
        gtk = true;
    };
    extraSessionCommands = ''
        export XKB_DEFAULT_LAYOUT=de
        export XKB_DEFAULT_VARIANT=nodeadkeys
        export SDL_VIDEODRIVER=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION='1'
        export _JAVA_AWT_WM_NONREPARENTING=1
        export XDG_CURRENT_DESKTOP=sway
    '';
  };

  services.xserver = {
    layout = "us";
    displayManager = {
      gdm.wayland = true;
    };
    displayManager.autoLogin = { enable = true; user = "espo"; };
    enable = true;
  };  

  hardware.opengl.enable = true;
  boot = {
    tmpOnTmpfs = true;
    kernel.sysctl."kernel.sysrq" = 1;
  };
}
