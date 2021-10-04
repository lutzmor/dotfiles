{ config, pkgs, ... }:

{
    environment.variables = {
        NIXOS_CONFIG="$HOME/.config/nixos/configuration.nix";
        NIXOS_CONFIG_DIR="$HOME/.config/nixos/";
    };

    nix = {
        autoOptimiseStore = true;
        allowedUsers = [ "espo" ];
        gc = {
            automatic = true;
            dates = "daily";
        };
        package = pkgs.nixUnstable;
        extraOptions = ''
            experimental-features = nix-command flakes
        '';
    };

    nixpkgs = {
	config = {
	  allowBroken = true;
	  allowUnfree = true;
        };
    };

    boot = {
        cleanTmpDir = true;
        loader = {
            systemd-boot.enable = true;
            systemd-boot.editor = false;
            efi.canTouchEfiVariables = true;
        }; 
    };

    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "us";
    };

    users.users.espo = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; 
        shell = pkgs.zsh;
        initialPassword = "hello";
    };

    services.openssh = {
        enable = true;
        permitRootLogin = "yes";
        passwordAuthentication = true;
    };

    security.protectKernelImage = true;
    system.stateVersion = "21.05";
}
