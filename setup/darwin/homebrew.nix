{ configs, pkgs, ... }:
{
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "none"; # keep it clean
    global = {
      brewfile = true;
      noLock = true;
    };

    taps = [
      "homebrew/core" # core
      "homebrew/cask" # we're using this for casks, after all
      "homebrew/cask-versions" # needed for firefox-nightly and discord-canary
    ];

    casks = [
      "discord-canary" # chat client of choice
      "via" # keyboard config
      "seaglass"
    ];
  };
}
