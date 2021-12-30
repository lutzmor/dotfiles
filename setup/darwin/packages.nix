{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #Development stuff
    jdk
    gradle
    kotlin
  ];
}
