{ config, pkgs, ... }:

let
  home = builtins.getEnv "HOME";
in {
  imports = [
    ./config.nix
    ../common
    ./defaults.nix
    ./wm.nix
    ./bloop.nix
    ./homebrew.nix
    ./fonts.nix
    ./packages.nix
    ./pam.nix
  ];
  
  environment.systemPackages = [ pkgs.zsh pkgs.gcc ];
  environment.shellAliases = {
    o = "open";
  };

  environment.variables = {
    NIXOS_CONFIG_DIR="/Users/espo/.nixpkgs";
  };

  networking.knownNetworkServices = ["Wi-Fi" "Bluetooth PAN" "Thunderbolt Bridge"];
  
  services.activate-system.enable = true;
  services.nix-daemon.enable = true;
  programs.nix-index.enable = true;
}
