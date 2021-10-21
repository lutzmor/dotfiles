{ pkgs, config, lib, ... }:

{
    # Install all the packages
    environment.systemPackages = with pkgs; [
        pavucontrol
        chromium teams
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
    powerManagement.powertop.enable = true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
