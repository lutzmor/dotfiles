{ pkgs, config, ... }:

{
    # Install all the packages
    environment.systemPackages = with pkgs; [
	git gnupg tmux fido2luks git-crypt
    ];
}