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
                matches = [ { "device.name" = "~bluez_card.*"; } ];
                actions = {
                    "update-props" = {
                        "bluez5.auto-connect" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
                        "bluez5.msbc-support" = true;
                        "bluez5.sbc-xq-support" = true;
                    };
                };
            }
            {
                matches = [
                    { "node.name" = "~bluez_input.*"; }
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
