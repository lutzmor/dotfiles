{ config, lib, pkgs, ...}:
{
  nixpkgs.overlays = [
    # post-5.4
    (self: super: { iptsd = super.callPackage ../../../overlay/iptsd { }; })
  ];
}
