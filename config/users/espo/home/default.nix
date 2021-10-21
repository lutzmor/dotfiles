{ }:
{
  stateVersion = "21.03";

  sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";

    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
  };
  

  file.".local/share/fonts/CALVINN.TTF".source = ./fonts/CALVINN.TTF;
  file.".local/share/fonts/CALVINO.TTF".source = ./fonts/CALVINO.TTF;
  file.".local/share/fonts/Inter-BlackItalic.otf".source = ./fonts/Inter-BlackItalic.otf;
  file.".local/share/fonts/Inter-Black.otf".source = ./fonts/Inter-Black.otf;
  file.".local/share/fonts/Inter-BoldItalic.otf".source = ./fonts/Inter-BoldItalic.otf;
  file.".local/share/fonts/Inter-Bold.otf".source = ./fonts/Inter-Bold.otf;
  file.".local/share/fonts/Inter-ExtraBoldItalic.otf".source = ./fonts/Inter-ExtraBoldItalic.otf;
  file.".local/share/fonts/Inter-ExtraBold.otf".source = ./fonts/Inter-ExtraBold.otf;
  file.".local/share/fonts/Inter-ExtraLightItalic.otf".source = ./fonts/Inter-ExtraLightItalic.otf;
  file.".local/share/fonts/Inter-ExtraLight.otf".source = ./fonts/Inter-ExtraLight.otf;
  file.".local/share/fonts/Inter-Italic.otf".source = ./fonts/Inter-Italic.otf;
  file.".local/share/fonts/Inter-LightItalic.otf".source = ./fonts/Inter-LightItalic.otf;
  file.".local/share/fonts/Inter-Light.otf".source = ./fonts/Inter-Light.otf;
  file.".local/share/fonts/Inter-MediumItalic.otf".source = ./fonts/Inter-MediumItalic.otf;
  file.".local/share/fonts/Inter-Medium.otf".source = ./fonts/Inter-Medium.otf;
  file.".local/share/fonts/Inter-Regular.otf".source = ./fonts/Inter-Regular.otf;
  file.".local/share/fonts/Inter-SemiBoldItalic.otf".source = ./fonts/Inter-SemiBoldItalic.otf;
  file.".local/share/fonts/Inter-SemiBold.otf".source = ./fonts/Inter-SemiBold.otf;
  file.".local/share/fonts/Inter-ThinItalic.otf".source = ./fonts/Inter-ThinItalic.otf;
  file.".local/share/fonts/Inter-Thin.otf".source = ./fonts/Inter-Thin.otf;
  file.".local/share/fonts/OperatorMono-Bold-Italic.otf".source = ./fonts/OperatorMono-Bold-Italic.otf;
  file.".local/share/fonts/OperatorMono-Bold-Regular.otf".source = ./fonts/OperatorMono-Bold-Regular.otf;
  file.".local/share/fonts/OperatorMono-Book-Italic.otf".source = ./fonts/OperatorMono-Book-Italic.otf;
  file.".local/share/fonts/OperatorMono-Book-Regular.otf".source = ./fonts/OperatorMono-Book-Regular.otf;
  file.".local/share/fonts/OperatorMono-Light-Italic.otf".source = ./fonts/OperatorMono-Light-Italic.otf;
  file.".local/share/fonts/OperatorMono-Light-Regular.otf".source = ./fonts/OperatorMono-Light-Regular.otf;
  file.".local/share/fonts/OperatorMono-Medium-Italic.otf".source = ./fonts/OperatorMono-Medium-Italic.otf;
  file.".local/share/fonts/OperatorMono-Medium-Regular.otf".source = ./fonts/OperatorMono-Medium-Regular.otf;
  file.".local/share/fonts/OperatorMono-XLight-Italic.otf".source = ./fonts/OperatorMono-XLight-Italic.otf;
  file.".local/share/fonts/OperatorMono-XLight-Regular.otf".source = ./fonts/OperatorMono-XLight-Regular.otf;
  
  file.".bin/import-gsettings".source = ./bin/import-gsettings;
  file.".bin/partial-screenshot.sh".source = ./bin/partial-screenshot.sh;
  file.".bin/screenshot.sh".source = ./bin/screenshot.sh;
  file.".bin/waybar-date.sh".source = ./bin/waybar-date.sh;

  file."stuff/pictures/wallpapers/bg-wallpaper.png".source = ./wallpapers/bg-wallpaper.png;
  file."stuff/pictures/wallpapers/lock-wallpaper.jpg".source = ./wallpapers/lock-wallpaper.jpg;
}
