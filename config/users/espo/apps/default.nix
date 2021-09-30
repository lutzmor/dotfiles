{ config, pkgs, ... }:
let
 zshsettings = import ./zsh/zsh.nix;
 firefoxsettings = import ./firefox/firefox.nix;
in
{
 home-manager.enable = true;
 gpg = import ./gpg/gpg.nix;
 git = import ./git/git.nix;
 newsboat = import ./newsboat/newsboat.nix;
 firefox = firefoxsettings pkgs;
 zsh = zshsettings pkgs;
}
