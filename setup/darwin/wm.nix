{config, pkgs, ...}:
{
  services.skhd.enable = true;
  services.skhd.package =  pkgs.skhd;
  services.skhd.skhdConfig = let
    modMask = "cmd";
    moveMask = "ctrl + cmd";
    myTerminal = "${pkgs.alacritty}/bin/alacritty";
    myEditor = "emacsclient -a '' -nc";
    myBrowser = "open /Applications/Safari.app";
    noop = "/dev/null";
    prefix = "${pkgs.yabai}/bin/yabai -m";
    fstOrSnd = {fst, snd}: domain: "${prefix} ${domain} --focus ${fst} || ${prefix} ${domain} --focus ${snd}";
    nextOrFirst = fstOrSnd { fst = "next"; snd = "first";};
    prevOrLast = fstOrSnd { fst = "prev"; snd = "last";};
  in ''
    # windows ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    # select
    ${modMask} - j                            : ${prefix} window --focus next || ${prefix} window --focus "$((${prefix} query --spaces --display next || ${prefix} query --spaces --display first) |${pkgs.jq}/bin/jq -re '.[] | select(.visible == 1)."first-window"')" || ${prefix} display --focus next || ${prefix} display --focus first
    ${modMask} - k                            : ${prefix} window --focus prev || ${prefix} window --focus "$((yabai -m query --spaces --display prev || ${prefix} query --spaces --display last) | ${pkgs.jq}/bin/jq -re '.[] | select(.visible == 1)."last-window"')" || ${prefix} display --focus prev || ${prefix} display --focus last

    # close
    ${modMask} + ${moveMask} - c	      : ${prefix} window --close && yabai -m window --focus prev

    # fullscreen
    ${modMask} - h                            : ${prefix} window --toggle zoom-fullscreen

    # rotate
    ${modMask} - r                            : ${prefix} window --focus smallest && yabai -m window --warp largest && yabai -m window --focus largest

    # increase region
    ${modMask} + ctrl - j		      : ${prefix} window --resize right:-20:0; \
						${prefix} window --resize left:-20:0 
    ${modMask} + ctrl - k	 	      : ${prefix} window --resize right:20:0; \
						${prefix} window --resize left:20:0
    # spaces ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    # switch 
    ${modMask} + alt - j                      : ${prevOrLast "space"}
    ${modMask} + alt - k                      : ${nextOrFirst "space"}

    # send window 
    ${modMask} + ${moveMask} - j              : ${prefix} window --space prev
    ${modMask} + ${moveMask} - k              : ${prefix} window --space next

    # display  ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    # focus 
    ${modMask} - left                         : ${prevOrLast "display"}
    ${modMask} - right                        : ${nextOrFirst "display"}

    # send window
    ${moveMask} - right                       : ${prefix} window --display prev
    ${moveMask} - left                        : ${prefix} window --display next

    # apps  ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    ${modMask} - return                       : ${myTerminal} 
    ${modMask} + shift - return               : ${myEditor}
    ${modMask} - b                            : ${myBrowser}


    # reset  ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    ${modMask} - q                            : pkill yabai; pkill skhd; osascript -e 'display notification "wm restarted"'
  '';
}
