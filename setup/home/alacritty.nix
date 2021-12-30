pkgs:
{
  enable = true;
    # We need to give it a dummy package
    package = pkgs.alacritty;
    settings = {
      window.padding.x = 45;
      window.padding.y = 45;
      window.decorations = "buttonless";
      window.dynamic_title = true;
      live_config_reload = true;
      mouse.hide_when_typing = true;
      use_thin_strokes = true;
      cursor.style = "Beam";

      font = {
        size = 14;
        normal.family = "Liga SFMono Nerd Font";
        normal.style = "Light";
        bold.family = "Liga SFMono Nerd Font";
        bold.style = "Bold";
        italic.family = "Liga SFMono Nerd Font";
        italic.style = "Italic";
      };
  colors = {
          cursor.cursor = "#81a1c1";
          primary.background = "#2e3440";
          primary.foreground = "#d8dee9";

          normal = {
            black = "#3b4252";
            red = "#bf616a";
            green = "#a3be8c";
            yellow = "#ebcb8b";
            blue = "#81a1c1";
            magenta = "#b48ead";
            cyan = "#88c0d0";
            white = "#e5e9f0";
          };

          bright = {
            black = "#4c566a";
            red = "#bf616a";
            green = "#a3be8c";
            yellow = "#ebcb8b";
            blue = "#81a1c1";
            magenta = "#b48ead";
            cyan = "#8fbcbb";
            white = "#eceff4";
          };
        };    

    };
}
