{ config, pkgs, ... }:
{
  environment.shells = [ pkgs.zsh ];
  programs.zsh.enable = true;
  environment.variables.SHELL = "/run/current-system/sw/bin/zsh";
}
