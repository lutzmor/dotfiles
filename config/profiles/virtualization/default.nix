{ pkgs, config, ... }:

{
  virtualisation.docker.enable = false;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
    defaultNetwork.dnsname.enable = true;
  };
  virtualisation.oci-containers.backend = "podman";
  environment.systemPackages = [ pkgs.docker-compose ];
  users.users.espo.extraGroups = ["podman"];
}
