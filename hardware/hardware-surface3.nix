{ config, lib, pkgs, ... }:

{
  # move into nixos module, set up a nixos option for surface model, use
  # that to enable IPTS, libwacom and other model-dependent config.

  imports = [
	./kernel
  ];

  nixpkgs.overlays = [
    # post-5.4
    (self: super: { iptsd = super.callPackage ../../overlay/iptsd { }; })
  ];

  systemd.services = {
    # not necessary for every model
    # https://github.com/linux-surface/linux-surface/wiki/Known-Issues-and-FAQ#sleep-script
    # only for kernels running original IPTS firmware
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

        ## If you have spontaneous wakeups, you may want to disable
        ## bluetooth completely, regardless if any devices are connected or not.
        ## Note that you may be required to re-connect your devices after resume
        ## if you choose this change.
        # if ps cax | grep bluetoothd; then
        #   bluetoothctl power off
        # fi
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

  # # not working with meson flag -Dsystemd=true
  # systemd.packages = [ pkgs.iptsd ];
  # services.udev.packages = [ pkgs.iptsd ];
  services.udev.extraRules = ''
    # iptsd
    KERNEL=="ipts/*", TAG+="systemd";
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
