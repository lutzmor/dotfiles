pkgs:
{
    enable = true;
    userName = "lutzmor";
    userEmail = "moritz.lutz@gmail.com";
    delta = {
      enable = true;
      options = {
        syntax-theme = "GitHub";
        line-numbers = true;
      };
    };
    ignores = [ ".dir-locals.el" ".envrc" ".DS_Store" ];
}
