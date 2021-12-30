{ config, lib, ...}:

with lib;

let
  cfg = config.espo.setup;
  home = builtins.getEnv "HOME";
in {
  options.espo.setup.host = mkOption {
    description = "Machine name";
  };
  options.espo.setup.user = mkOption {
    default = "espo";    
    description = "Main user name";    
  };
  config = {
    networking.hostName = cfg.host;
    nix.maxJobs = lib.mkDefault 4;
    environment.darwinConfig = "${home}/.config/nix/machines/${cfg.host}/configuration.nix";
    system.stateVersion = 3;
    nixpkgs.overlays =
    let path = ../../overlays; in with builtins;
      map (n: import (path + ("/" + n)))
          (filter (n: match ".*\\.nix" n != null ||
                      pathExists (path + ("/" + n + "/default.nix")))
            (attrNames (readDir path)));
  };
}
