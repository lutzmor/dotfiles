{
 ".local/share/dwm/autostart.sh" = {
   executable = true;
   text = "
     #!/bin/sh
     status () {
       echo -n BAT: \"$(acpi | awk '{print $4}' | sed s/,//) | $(date '+%m/%d %H:%M') \"
     }
     feh --no-fehbg --bg-fill $NIXOS_CONFIG_DIR/config/users/espo/apps/rice/pics/wallpaper.png
     rm $HOME/.xsession-errors $HOME/.xsession-errors.old .bash_history
     xrandr --rate 144
     while true; do
       xsetroot -name \"$(status)\"
       sleep 30
     done";
  };
}
