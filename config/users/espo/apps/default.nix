{ config, pkgs, ... }:
let
 zshsettings = import ./zsh/zsh.nix;
in
{
 home-manager.enable = true;
 gpg = import ./gpg/gpg.nix;
 git = import ./git/git.nix;
 kitty = import ./kitty/kitty.nix;
 zsh = zshsettings pkgs;
}
