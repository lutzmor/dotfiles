{ config, pkgs, home-manager, ... }:

{
  users.users.espo = {
    home = "/Users/espo";
    shell = pkgs.zsh;
  };

  home-manager.users.espo.programs.git = import ./git.nix pkgs;
  home-manager.users.espo.programs.alacritty = import ./alacritty.nix pkgs;
  home-manager.users.espo.programs.zsh = import ./shells.nix pkgs;
  home-manager.users.espo.programs.bat = import ./bat.nix pkgs;
	home-manager.users.espo.programs.direnv.enable = true;
	home-manager.users.espo.programs.direnv.nix-direnv.enable = true;
}
