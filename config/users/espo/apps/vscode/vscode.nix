{ pkgs, ...}:

{
  enable = true;
  package = pkgs.vscode;
  extensions = with pkgs.vscode-extensions; [
    dracula-theme.theme-dracula
    vscodevim.vim
  ];
}
