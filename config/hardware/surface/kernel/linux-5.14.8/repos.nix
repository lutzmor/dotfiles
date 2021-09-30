{ lib, pkgs, fetchFromGitHub, fetchurl }: {
  linux-surface = fetchFromGitHub {
    owner = "linux-surface";
    repo = "linux-surface";
    rev = "4130746c31606aebaccef58997b650beda9049f7";
    sha256 = "0r74z0hj3rg8bn2arh2zj8p7awk7fi14gpyrs5h44lwxw4351xky";
  };
}
