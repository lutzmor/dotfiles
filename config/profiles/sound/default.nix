{ pkgs, config, lib, ... }:

{

    security.rtkit.enable = true;
    hardware.bluetooth.enable = true;
    hardware.bluetooth.hsphfpd.enable = true;
    hardware.pulseaudio.enable = false;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        media-session.config.bluez-monitor.rules = [
            {
                # Matches all cards
                matches = [ { "device.name" = "~bluez_card.*"; } ];
                actions = {
                    "update-props" = {
                        "bluez5.auto-connect" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
                        # mSBC is not expected to work on all headset + adapter>
                        #"bluez5.msbc-support" = true;
                        # SBC-XQ is not expected to work on all headset + adapt>
                        #"bluez5.sbc-xq-support" = true;
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
}
