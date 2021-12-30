{ config, lib, pkgs, ... }:
{
  systemd.services = {
    surface-sleep = {
      enable = lib.versionOlder config.boot.kernelPackages.kernel.version "5.4";
      before = [ "suspend.target" ];
      wantedBy = [ "suspend.target" ];
      serviceConfig.Type = "oneshot";
      path = with pkgs; [ procps kmod bluez ];
      script = ''
        # Disable bluetooth if no device is connected
        if ps cax | grep bluetoothd && ! bluetoothctl info; then
          bluetoothctl power off
        fi
      '';
    };
    surface-wake = {
      enable = lib.versionOlder config.boot.kernelPackages.kernel.version "5.4";
      after = [ "post-resume.target" ];
      wantedBy = [ "post-resume.target" ];
      serviceConfig.Type = "oneshot";
      path = with pkgs; [ procps kmod bluez ];
      script = ''
        # Restart bluetooth
        if ps cax | grep bluetoothd; then
          bluetoothctl power on
        fi
      '';
    };

    iptsd = {
      description = "IPTSD";
      script = "${pkgs.iptsd}/bin/iptsd";
      wantedBy = [ "multi-user.target" ];
    };
  };
  
  services.udev.extraRules = ''
    KERNEL=="ipts/*", TAG+="systemd";
    ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="on";
  '';

  environment.etc."ipts.conf".text = ''
    [Config]
    # BlockOnPalm = false
    # TouchThreshold = 10
    # StabilityThreshold = 0.1
    #
    ## The following values are device specific
    ## and will be loaded from /usr/share/ipts
    ##
    ## Only set them if you need to provide custom
    ## values for new devices that are not yet supported
    #
    # InvertX = false
    # InvertY = false
    # Width = 0
    # Height = 0
  '';
}
