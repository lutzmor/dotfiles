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
        config.pipewire = {
          "context.properties" = {
            "link.max-buffers" = 16;
            "log.level" = 2;
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 32;
            "default.clock.min-quantum" = 32;
            "default.clock.max-quantum" = 32;
            "core.daemon" = true;
            "core.name" = "pipewire-0";
          };
          "context.modules" = [ {
            name = "libpipewire-module-rtkit";
            args = {
              "nice.level" = -15;
              "rt.prio" = 88;
              "rt.time.soft" = 200000;
              "rt.time.hard" = 200000;
            };
            flags = [ "ifexists" "nofail" ];
          }
          { name = "libpipewire-module-protocol-native"; }
          { name = "libpipewire-module-profiler"; }
          { name = "libpipewire-module-metadata"; }
          { name = "libpipewire-module-spa-device-factory"; }
          { name = "libpipewire-module-spa-node-factory"; }
          { name = "libpipewire-module-client-node"; }
          { name = "libpipewire-module-client-device"; }
          {
            name = "libpipewire-module-portal";
            flags = [ "ifexists" "nofail" ];
          }
          {
            name = "libpipewire-module-access";
            args = {};
          }
          { name = "libpipewire-module-adapter"; }
          { name = "libpipewire-module-link-factory"; }
          { name = "libpipewire-module-session-manager"; }
          { name = libpipewire-module-filter-chain
            args = {
              node.name =  "rnnoise_source"
              node.description =  "Noise Canceling source"
              media.name =  "Noise Canceling source"
              filter.graph = {
                  nodes = [
                      {
                          type = ladspa
                          name = rnnoise
                          plugin = ladspa/librnnoise_ladspa
                          label = noise_suppressor_stereo
                          control = {
                            "VAD Threshold (%)" 50.0
                          }
                      }
                  ]
              }
              capture.props = {
                node.passive = true
              }
              playback.props = {
                media.class = Audio/Source
              }
            }
          }];
        };
        #bluetooth stuff
        media-session.config.bluez-monitor.rules = [
            {
                # Matches all cards
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
