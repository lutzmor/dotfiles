{ pkgs, config, lib, ... }:

{
    # Install all the packages
    environment.systemPackages = with pkgs; [
        feh
        fzf ripgrep newsboat ffmpeg tealdeer exa 
        pass slop bat tmux
        libnotify sct update-nix-fetchgit pavucontrol pulseaudio
        chromium mpv anki teams
        gcc gnumake python3 
    ];
    
    fonts.fonts = with pkgs; [
        jetbrains-mono
        roboto
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    networking = {
        networkmanager.enable = true;
    };

    services.tlp.enable = true;
    powerManagement.powertop.enable = true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
