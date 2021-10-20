{ config, lib, pkgs, ... }:

{
  imports = [
#    ./common
    ./surface/kernel
    ./surface/services
    ./surface/pkgs
  ];
  
  disabledModules = [
    "tasks/swraid.nix" # stop blanket importing raid modules because my kernel doesn't include them, thanks
  ];

  boot = {
   extraModprobeConfig = lib.mkDefault ''
    options i915 enable_fbc=1 enable_rc6=1 modeset=1
    options snd_hda_intel power_save=1
    options snd_ac97_codec power_save=1
    options iwlwifi power_save=Y
    options iwldvm force_cam=N
   '';
   kernelModules = [ "kvm-intel" ];
   initrd = {
     includeDefaultModules = false;
     availableKernelModules = [ "xhci_pci" "nvme" "intel_lpss" "intel_lpss_pci" "8250_dw"
                                "surface_aggregator" "surface_aggregator_registry" "surface_hid_core" "surface_hid" ];
     kernelModules = [ ];
     luks.cryptoModules = [ "aes" ];
   };
  };

  hardware = {
    video.hidpi.enable = lib.mkDefault true;
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
  };
}
