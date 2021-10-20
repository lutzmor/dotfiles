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

    surface-iptsd = {
      enable = true;
      description = "Intel Precise Touch & Stylus Daemon";
      documentation = [ "https://github.com/linux-surface/iptsd" ];
      after = [ "dev-ipts-0.device" ];
      wants = [ "dev-ipts-0.device" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "simple";
      path = [ pkgs.iptsd ];
      script = ''
        iptsd
      '';
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
