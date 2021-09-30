{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
	(modulesPath + "/installer/scan/not-detected.nix")
	../../hardware/surface/surface7.nix
        ../../profiles/core
	../../profiles/laptop
	../../profiles/virtualization
	./encryption.nix
    ];
  
  networking.hostName = "bambam";
  networking.interfaces.wlp0s20f3.useDHCP = true;
  hardware.video.hidpi.enable = lib.mkDefault true;

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
     availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" 
				"surface_aggregator" "surface_aggregator_registry" "surface_hid" ];
     kernelModules = [ ];
     luks = {
       devices."enc" = {
         device = "/dev/disk/by-uuid/bed42183-4db5-47de-963a-4bdc9572ea2b";
         preLVM = true;
       };
     };
   };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/5910dc30-6d3f-478e-997a-66f86d5a5130";
      fsType = "btrfs";
      options = [ "subvol=nixos" "compress=zstd" "autodefrag" "noatime"];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/5910dc30-6d3f-478e-997a-66f86d5a5130";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "autodefrag" "noatime"];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3C2C-8D2B";
      fsType = "vfat";
    };

  swapDevices = [ ];
}
