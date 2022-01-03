{ pkgs
, config
, lib
, ...
}:

(import ../../setup/darwin { inherit config pkgs; }) // {
  espo.setup.host = "kimmei";
  nix = {
    extraOptions = ''
      system = aarch64-darwin
      extra-platforms = aarch64-darwin x86_64-darwin
      build-users-group = nixbld
    '';
  };
}
