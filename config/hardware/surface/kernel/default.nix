{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.callPackage ./linux-5.13.4 { };
  #boot.kernelPackages = pkgs.callPackage ./linux-5.14.8 { };
}
