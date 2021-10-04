{ pkgs, config, lib, ... }:

{
 environment.systemPackages = with pkgs; {
	dwm dmenu dunst st
 ];

 services.xserver = {
   layout = "us";
   enable = true;

   displayManager.lightdm.enable = true;
   windowManager.dwm.enable = true;
   displayManager.autoLogin = { enable = true; user = "espo"; };
    libinput = {
     enable = true;
     touchpad.naturalScrolling = true;
   };
 };
}
