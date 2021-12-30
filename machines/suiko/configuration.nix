{ pkgs
, config
, lib
, ...
}:

(import ../../setup/darwin { inherit config pkgs; }) // {
  espo.setup.host = "suiko";
}
