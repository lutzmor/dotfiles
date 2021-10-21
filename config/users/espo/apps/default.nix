{ config, pkgs, ... }:
let
 zshsettings = import ./zsh/zsh.nix;
in
{
 home-manager.enable = true;
 gpg = import ./gpg/gpg.nix;
 git = import ./git/git.nix;
 kitty = import ./kitty/kitty.nix;
 mako = import ./mako/mako.nix;
 zsh = zshsettings pkgs;
}
