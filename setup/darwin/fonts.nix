{ config, pkgs, lib, ... }:

let
  pragmatapro = pkgs.callPackage ./pragmatapro {};
  sf-liga-mono-bin = pkgs.callPackage ./sf-liga-mono-bin {};
in {
  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [ pragmatapro sf-liga-mono-bin ];
  } // lib.optionalAttrs pkgs.stdenvNoCC.isLinux {
    fontconfig.enable = true;
    fontconfig.dpi = 180;
  };
}
