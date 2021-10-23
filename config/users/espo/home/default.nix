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
  
  # Copy custom fonts
  file.".local/share/fonts/CALVINN.TTF".source = ./files/fonts/CALVINN.TTF;
  file.".local/share/fonts/CALVINO.TTF".source = ./files/fonts/CALVINO.TTF;
  file.".local/share/fonts/Inter-BlackItalic.otf".source = ./files/fonts/Inter-BlackItalic.otf;
  file.".local/share/fonts/Inter-Black.otf".source = ./files/fonts/Inter-Black.otf;
  file.".local/share/fonts/Inter-BoldItalic.otf".source = ./files/fonts/Inter-BoldItalic.otf;
  file.".local/share/fonts/Inter-Bold.otf".source = ./files/fonts/Inter-Bold.otf;
  file.".local/share/fonts/Inter-ExtraBoldItalic.otf".source = ./files/fonts/Inter-ExtraBoldItalic.otf;
  file.".local/share/fonts/Inter-ExtraBold.otf".source = ./files/fonts/Inter-ExtraBold.otf;
  file.".local/share/fonts/Inter-ExtraLightItalic.otf".source = ./files/fonts/Inter-ExtraLightItalic.otf;
  file.".local/share/fonts/Inter-ExtraLight.otf".source = ./files/fonts/Inter-ExtraLight.otf;
  file.".local/share/fonts/Inter-Italic.otf".source = ./files/fonts/Inter-Italic.otf;
  file.".local/share/fonts/Inter-LightItalic.otf".source = ./files/fonts/Inter-LightItalic.otf;
  file.".local/share/fonts/Inter-Light.otf".source = ./files/fonts/Inter-Light.otf;
  file.".local/share/fonts/Inter-MediumItalic.otf".source = ./files/fonts/Inter-MediumItalic.otf;
  file.".local/share/fonts/Inter-Medium.otf".source = ./files/fonts/Inter-Medium.otf;
  file.".local/share/fonts/Inter-Regular.otf".source = ./files/fonts/Inter-Regular.otf;
  file.".local/share/fonts/Inter-SemiBoldItalic.otf".source = ./files/fonts/Inter-SemiBoldItalic.otf;
  file.".local/share/fonts/Inter-SemiBold.otf".source = ./files/fonts/Inter-SemiBold.otf;
  file.".local/share/fonts/Inter-ThinItalic.otf".source = ./files/fonts/Inter-ThinItalic.otf;
  file.".local/share/fonts/Inter-Thin.otf".source = ./files/fonts/Inter-Thin.otf;
  file.".local/share/fonts/OperatorMono-Bold-Italic.otf".source = ./files/fonts/OperatorMono-Bold-Italic.otf;
  file.".local/share/fonts/OperatorMono-Bold-Regular.otf".source = ./files/fonts/OperatorMono-Bold-Regular.otf;
  file.".local/share/fonts/OperatorMono-Book-Italic.otf".source = ./files/fonts/OperatorMono-Book-Italic.otf;
  file.".local/share/fonts/OperatorMono-Book-Regular.otf".source = ./files/fonts/OperatorMono-Book-Regular.otf;
  file.".local/share/fonts/OperatorMono-Light-Italic.otf".source = ./files/fonts/OperatorMono-Light-Italic.otf;
  file.".local/share/fonts/OperatorMono-Light-Regular.otf".source = ./files/fonts/OperatorMono-Light-Regular.otf;
  file.".local/share/fonts/OperatorMono-Medium-Italic.otf".source = ./files/fonts/OperatorMono-Medium-Italic.otf;
  file.".local/share/fonts/OperatorMono-Medium-Regular.otf".source = ./files/fonts/OperatorMono-Medium-Regular.otf;
  file.".local/share/fonts/OperatorMono-XLight-Italic.otf".source = ./files/fonts/OperatorMono-XLight-Italic.otf;
  file.".local/share/fonts/OperatorMono-XLight-Regular.otf".source = ./files/fonts/OperatorMono-XLight-Regular.otf;
  file.".local/share/fonts/OperatorMono-Bold-Italic-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Bold-Italic-NerdFontComplete.otf;
  file.".local/share/fonts/OperatorMono-Bold-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Bold-NerdFontComplete.otf;
  file.".local/share/fonts/OperatorMono-Book-Italic-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Book-Italic-NerdFontComplete.otf;
  file.".local/share/fonts/OperatorMono-Book-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Book-NerdFontComplete.otf;
  file.".local/share/fonts/OperatorMono-Light-Italic-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Light-Italic-NerdFontComplete.otf;
  file.".local/share/fonts/OperatorMono-Light-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Light-NerdFontComplete.otf;
  file.".local/share/fonts/OperatorMono-Medium-Italic-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Medium-Italic-NerdFontComplete.otf;
  file.".local/share/fonts/OperatorMono-Medium-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Medium-NerdFontComplete.otf;
  file.".local/share/fonts/OperatorMono-Extra-Light-Italic-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Extra-Light-Italic-NerdFontComplete.otf;
  file.".local/share/fonts/OperatorMono-Extra-Light-NerdFontComplete.otf".source = ./files/fonts/OperatorMono-Extra-Light-NerdFontComplete.otf;

  # Copy scripts
  file.".bin/import-gsettings".source = ./files/bin/import-gsettings;
  file.".bin/partial-screenshot.sh".source = ./files/bin/partial-screenshot.sh;
  file.".bin/screenshot.sh".source = ./files/bin/screenshot.sh;
  file.".bin/waybar-date.sh".source = ./files/bin/waybar-date.sh;
  file.".bin/headset.sh".source = ./files/bin/headset.sh;
  file.".bin/mopidy.sh".source = ./files/bin/mopidy.sh;
  file.".bin/chrome.sh".source = ./files/bin/chrome.sh;
  file.".bin/ncmpcpp.sh".source = ./files/bin/ncmpcpp.sh;
  file.".bin/pavucontrol.sh".source = ./files/bin/pavucontrol.sh;
  file.".bin/qutebrowser.sh".source = ./files/bin/qutebrowser.sh;
  
  # Copy wallpapers
  file."stuff/pictures/wallpapers/bg-wallpaper.png".source = ./files/wallpapers/bg-wallpaper.png;
  file."stuff/pictures/wallpapers/lock-wallpaper.jpg".source = ./files/wallpapers/lock-wallpaper.jpg;

  # Copy applications
  file.".local/share/applications/headset.desktop".source = ./files/applications/headset.desktop;
  file.".local/share/applications/music.desktop".source = ./files/applications/music.desktop;
  file.".local/share/applications/chrome.destkop".source = ./files/applications/chrome.desktop;
  file.".local/share/applications/pavucontrol.desktop".source = ./files/applications/pavucontrol.desktop;
  file.".local/share/applications/qutebrowser.desktop".source = ./files/applications/qutebrowser.desktop;
}
