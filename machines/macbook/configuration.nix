# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, self, ... }:

{
  imports =
    [
	./hardware-configuration.nix
	../../hardware/macbookpro/default.nix
        ../../hardware/macbookpro/system-config.nix
    ];

  networking = {
    hostName = "suiko";
    wireless.enable = false;
    wireless.iwd.enable = true;
  };
  
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Berlin";

  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };

  users.motd = with config; ''
    Host       ${networking.hostName}
    OS         NixOS ${system.nixos.release} (${system.nixos.codeName})
    Version    ${system.nixos.version}
    Kernel     ${boot.kernelPackages.kernel.version}
  '';

  programs = {
    light.enable = true;
    adb.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "caps:swapescape";
    displayManager.startx.enable = true;
    libinput.enable = true;
  };

  services.batteryNotifier = {
    enable = true;
    notifyCapacity = 20;
    suspendCapacity = 10;
  };

  users.users.espo = {
    isNormalUser = true;
    home = "/home/espo";
    extraGroups = [ "wheel" "users" "tty" "audio" "video" "input" "adbusers" "docker" ];
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes ca-references ca-derivations
      warn-dirty = false
      keep-outputs = true
      keep-derivations = true
    '';
  };

  nix.trustedUsers =
    [
      "root"
      "espo"
    ];

  system.stateVersion = "20.03"; # Did you read the comment?
}
