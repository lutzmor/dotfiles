{ config, lib, pkgs, linux_surface, ... }:
 let
  inherit (builtins) readFile;

  patches = linux_surface + "/patches";
  surface_kernelPatches = [
    { name = "microsoft-surface-patches";
      patch = null;
      structuredExtraConfig = with lib.kernel; {
        APDS9960 = module;
        MISC_IPTS = module;
      };
    }
    {
      name = "ms-surface/0001-surface3-oemb";
      patch = patches + "/5.14/0001-surface3-oemb.patch";
    }
    {
      name = "ms-surface/0002-mwifiex";
      patch = patches + "/5.14/0002-mwifiex.patch";
    }
    {
      name = "ms-surface/0003-ath10k";
      patch = patches + "/5.14/0003-ath10k.patch";
    }
    {
      name = "ms-surface/0004-ipts";
      patch = patches + "/5.14/0004-ipts.patch";
    }
    {
      name = "ms-surface/0005-surface-sam";
      patch = patches + "/5.14/0005-surface-sam.patch";
    }
    {
      name = "ms-surface/0006-surface-sam-over-hid";
      patch = patches + "/5.14/0006-surface-sam-over-hid.patch";
    }
    {
      name = "ms-surface/0007-surface-gpe";
      patch = patches + "/5.14/0007-surface-gpe.patch";
    }
    {
      name = "ms-surface/0008-surface-button";
      patch = patches + "/5.14/0008-surface-button.patch";
    }
    {
      name = "ms-surface/0009-surface-typecover";
      patch = patches + "/5.14/0009-surface-typecover.patch";
    }
    {
      name = "ms-surface/0010-cameras";
      patch = patches + "/5.14/0010-cameras.patch";
    }
    {
      name = "ms-surface/0011-amd-gpio";
      patch = patches + "/5.14/0011-amd-gpio.patch";
    }
    {
      name = "ms-surface/0012-amd-s0ix";
      patch = patches + "/5.14/0012-amd-s0ix.patch";
    }
  ];
  
  kernel = pkgs.callPackage ./kernel.nix { kernelPatches = surface_kernelPatches };
  linuxPackages = (pkgs.linuxPackagesFor kernel);
 in
{
  boot.kernelPackages = linuxPackages;
}
