{ pkgs, config, lib, ... }:

{
    # Install all the packages
    environment.systemPackages = with pkgs; [
        feh
        fzf ripgrep newsboat ffmpeg tealdeer exa 
        pass slop bat tmux
        libnotify sct update-nix-fetchgit pavucontrol pulseaudio
	xlayoutdisplay 
        chromium mpv anki teams citrix_workspace
        gcc gnumake python3 
    ];
    
    fonts.fonts = with pkgs; [
        jetbrains-mono
        roboto
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    networking = {
        networkmanager.enable = true;
        firewall = {
            enable = true;
            allowedTCPPorts = [ 443 80 ];
            allowedUDPPorts = [ 443 80 44857 ];
            allowPing = false;

            # Allow wireguard
            logReversePathDrops = true;
            extraCommands = ''
                ip46tables -t raw -I nixos-fw-rpfilter -p udp -m udp --sport 44857 -j RETURN
                ip46tables -t raw -I nixos-fw-rpfilter -p udp -m udp --dport 44857 -j RETURN
            '';
            extraStopCommands = ''
                ip46tables -t raw -D nixos-fw-rpfilter -p udp -m udp --sport 44857 -j RETURN || true
                ip46tables -t raw -D nixos-fw-rpfilter -p udp -m udp --dport 44857 -j RETURN || true
            '';
        };
    };

    services.tlp.enable = true;
    powerManagement.powertop.enable = true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
