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
 kitty = import ./kitty/kitty.nix;
 vscode = import ./vscode/vscode.nix pkgs;
 firefox = firefoxsettings pkgs;
 zsh = zshsettings pkgs;
}
