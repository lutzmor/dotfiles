{ pkgs, config, ... }:

{
  environment.variables = {
    NIXOS_CONFIG="$HOME/.config/nixos/configuration.nix";
    NIXOS_CONFIG_DIR="$HOME/.config/nixos/";
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

  environment.systemPackages = with pkgs; [
    git 
    gnupg 
  ];

  nix = {
    package = pkgs.nixUnstable;
    buildCores = 0;
    autoOptimiseStore = true;
    gc.automatic = true;
    optimise.automatic = true;
    useSandbox = true;
    allowedUsers = [ "@wheel" ];
    trustedUsers = [ "root" "@wheel" ];
    extraOptions = ''
      experimental-features = nix-command flakes ca-references
      keep-outputs = true
      keep-derivations = true
    '';
  };

  security = {
    protectKernelImage = true;
  };

  
  system.stateVersion = "21.05";  
}
