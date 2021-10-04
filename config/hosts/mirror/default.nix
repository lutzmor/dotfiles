{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
	(modulesPath + "/installer/scan/not-detected.nix")
	../../hardware/surface/surface7.nix
    ../../profiles/core
	../../profiles/laptop
	../../profiles/wayland
    ];
  
  networking.hostName = "mirror";
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
   };
  };
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/16fa4885-a41e-4762-b8b4-6f6d14faa4ac";
      fsType = "btrfs";
      options = [ "subvol=nixos" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/16fa4885-a41e-4762-b8b4-6f6d14faa4ac";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/FB2A-9501";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/d639a68f-1d42-417e-a502-ed0fab2303e3"; }
    ];
}
