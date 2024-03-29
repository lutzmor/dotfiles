{ config, pkgs, ... }:
let
  weechat-vidbina = with pkgs; weechat.override {
    # https://nixos.org/manual/nixpkgs/stable/#sec-weechat
    configure = { availablePlugins, ... }: {
      plugins = with availablePlugins; [
        (perl.withPackages (p: [ p.PodParser ]))
        (python.withPackages (_: with weechatScripts; [ weechat-matrix ]))
      ];
      scripts = with weechatScripts; [
        wee-slack
        weechat-autosort
        weechat-matrix
      ];
    };
  };
in
{
  environment.systemPackages = with pkgs; [
    weechat-vidbina
  ];
}
