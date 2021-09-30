{ pkgs, config, ... }:

{
  virtualisation.docker.enable = true;
  users.users.espo.extraGroups = [ "docker" ];
}
