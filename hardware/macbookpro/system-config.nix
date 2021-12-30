{ pkgs, config, ... }:
{
  imports = [
    ./modules/wifi-fw-selection.nix
  ];

  # Improves system stability - https://canary.discord.com/channels/595304521857630254/595304521857630259/809475825589026826
  # Disable built in audio, as it's not working that well - 2021-05-12
  boot.kernelParams = [ "intel_iommu=on" "apple_bce.aaudio_enabled=0" "quiet" "systemd.show_status=1"];

  # Use custom kernel
  boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linux-mbp;
  boot.extraModulePackages = with pkgs; [ apple-bce apple-ib-drv ];

  # Load Apple hardware modules early
  boot.initrd.kernelModules = [ "apple_bce" "apple-ibridge" "apple-ib-tb" "usb_storage" ];

  # Include wifi firmware
  hardware.appleWifiFirmware.model = "MacBookPro15,2";
  hardware.firmware = [ (pkgs.apple-wifi-firmware.override { macModel = config.hardware.appleWifiFirmware.model; }) ];

  # Allow unfree - wifi firmware won't be installed otherwise.
  nixpkgs.config.allowUnfree = true;

  boot.loader.efi.canTouchEfiVariables = false;

  # Binary cache for t2linux derivations.
  nix = {
    binaryCaches = [
      "https://t2linux.cachix.org"
    ];
    binaryCachePublicKeys = [
      "t2linux.cachix.org-1:P733c5Gt1qTcxsm+Bae0renWnT8OLs0u9+yfaK2Bejw="
    ];
  };

  # suspend/resume is quite broken - 2021-05-12
  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchDocked = "ignore";
  services.logind.lidSwitchExternalPower = "ignore";
}
