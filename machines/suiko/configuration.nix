{ pkgs
, config
, lib
, ...
}:

(import ../../setup/darwin { inherit config pkgs; }) // {
  espo.setup.host = "suiko";
  security.pam.enableSudoTouchIdAuth = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      builders = @/etc/nix/machines
      system = x86_64-darwin
      extra-platforms = x86_64-darwin
      build-users-group = nixbld
      experimental-features = nix-command flakes
    '';
  };
}
