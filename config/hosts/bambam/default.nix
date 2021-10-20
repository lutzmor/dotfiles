{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
	(modulesPath + "/installer/scan/not-detected.nix")
	../../hardware/hardware-surface7.nix
        ../../profiles/core
	../../profiles/laptop
	../../profiles/wayland
	../../profiles/sound
	../../profiles/virtualization
	#./encryption.nix
    ];
  
  networking = {
    hostName = "bambam";
    interfaces.wlp0s20f3.useDHCP = true;
  };

  boot = {
   initrd = {
     luks = {
       fido2Support = true;
       devices."enc" = {
         device = "/dev/nvme0n1p2";
         preLVM = true;
	 #fido2.credential = "1a3742467558aa5e00dc58197d6e4ee7be4431f0a689c5000aad6c21d94f798b418852dae2262619c1da2be7562ec9dd94888c71a9326fea70dfe16214b5ea8ec0143d030000";
         #fido2.passwordLess = true;
       };
     };
   };
  };
  
  fileSystems."/" =
    { device = "/dev/mapper/enc";
      fsType = "btrfs";
      options = [ "subvol=nixos" "compress=zstd" "autodefrag" "noatime"];
    };

  fileSystems."/home" =
    { device = "/dev/mapper/enc";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "autodefrag" "noatime"];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/nixos-boot";
      fsType = "vfat";
    };

  #swapDevices = [ { device = "/dev/nvme0n1p2"; } ];
}
