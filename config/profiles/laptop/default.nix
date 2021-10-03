{ pkgs, config, lib, ... }:

{
    # Install all the packages
    environment.systemPackages = with pkgs; [
        # Rice/desktop
        dwm dmenu feh dunst st

        # Command-line tools
        fzf ripgrep newsboat ffmpeg tealdeer exa 
        pass slop bat tmux
        libnotify sct update-nix-fetchgit pavucontrol pulseaudio
       
        # GUI applications
        firefox mpv anki

        # Development
        gcc gnumake python3 

        # Language servers for neovim; change these to whatever languages you code in
        # Please note: if you remove any of these, make sure to also remove them from nvim/config/nvim/lua/lsp.lua!!
        rnix-lsp
        sumneko-lua-language-server
    ];

    # X server settings
    services.xserver = {
        layout = "us";
        enable = true;

        # Display manager and window manager
        displayManager.lightdm.enable = true;
        windowManager.dwm.enable = true;
        displayManager.autoLogin = { enable = true; user = "espo"; };
        # Touchpad scrolling
        libinput = {
            enable = true;
            touchpad.naturalScrolling = true;
        };
    };
    
    security.rtkit.enable = true;
    services.bluetooth.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        config.pipewire = {
            "context.properties" = {
                #"link.max-buffers" = 64;
                "link.max-buffers" = 16; # version < 3 clients can't handle more than this
                "log.level" = 2; # https://docs.pipewire.org/#Logging
                #"default.clock.rate" = 48000;
                #"default.clock.quantum" = 1024;
                #"default.clock.min-quantum" = 32;
                #"default.clock.max-quantum" = 8192;
            };
        };
        media-session.config.bluez-monitor.rules = [
            {
                # Matches all cards
                matches = [ { "device.name" = "~bluez_card.*"; } ];
                actions = {
                    "update-props" = {
                        "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
                        # mSBC is not expected to work on all headset + adapter combinations.
                        "bluez5.msbc-support" = true;
                        # SBC-XQ is not expected to work on all headset + adapter combinations.
                        "bluez5.sbc-xq-support" = true;
                    };
                };
            }
            {
                matches = [
                    # Matches all sources
                    { "node.name" = "~bluez_input.*"; }
                    # Matches all outputs
                    { "node.name" = "~bluez_output.*"; }
                ];
                actions = {
                    "node.pause-on-idle" = false;
               };
            }
        ];
    };
    
    users.extraUsers.espo.extraGroups = [ "audio" ];

     # Install fonts
    fonts.fonts = with pkgs; [
        jetbrains-mono
        roboto
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    # Set up networking and secure it
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
