{ pkgs, config, lib, ... }:

{
    programs.light.enable = true;
    nixpkgs.overlays =
    let
      light_ov = self: super: {
        light = super.light.overrideAttrs (o: {
          src = self.fetchFromGitHub {
            owner = "haikarainen";
            repo = "light";
            rev = "ae7a6ebb45a712e5293c7961eed8cceaa4ebf0b6";
            sha256 = "00z9bxrkjpfmfhz9fbf6mjbfqvixx6857mvgmiv01fvvs0lr371n";
          };
        });
      };
    in
    [ light_ov ];
    services.chrony.enable = true;
    services.timesyncd.enable = false;

    # Install all the packages
    environment.systemPackages = with pkgs; [
      acpi
      wirelesstools
      pciutils
      usbutils
      git-crypt
      fido2luks
      tmux
    ];
    
    fonts.fonts = with pkgs; [
        jetbrains-mono
        roboto
        google-fonts
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    networking = {
        networkmanager.enable = true;
    };

    services.tlp.enable = true;
    services.thermald.enable = true;
    services.upower.enable = lib.mkDefault true;
    powerManagement.powertop.enable = true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
