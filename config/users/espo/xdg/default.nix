{
 userDirs = {
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
 configFile = {
   "sway/config".source = ./sway/config;
   "sway/import-gsettings".source = ./sway/import-gsettings;
   "sway/scripts/mediaplayer.py".source = ./sway/scripts/mediaplayer.py;
   "waybar/config".source = ./waybar/config;
   "waybar/style.css".source = ./waybar/style.css;
   "wofi/config".source = ./wofi/config;
   "wofi/style.css".source = ./wofi/style.css;
   "kanshi/config".source = ./kanshi/config;
 };
}
