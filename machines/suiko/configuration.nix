{ pkgs
, config
, lib
, ...
}:

(import ../../setup/darwin { inherit config pkgs; }) // {
  espo.setup.host = "suiko";
  security.pam.enableSudoTouchIdAuth = true;
  nix = {
    extraOptions = ''
      system = x86_64-darwin
      extra-platforms = x86_64-darwin
      build-users-group = nixbld
    '';
  };
}
