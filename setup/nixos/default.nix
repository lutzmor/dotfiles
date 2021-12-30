{ config, pkgs, ... }:
{
  imports = [
    ./system.nix
    ../common
    ./openssh.nix
  ];  
  
  users.users.espo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    initialPassword = "hello";
  };

  networking = {
    networkmanager.enable = true;
  };

  services.tlp.enable = true;
  services.thermald.enable = true;
  services.upower.enable = lib.mkDefault true;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

}
