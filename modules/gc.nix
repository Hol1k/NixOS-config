{ config, pkgs, ... }:

{
  nix.gc = {
    automatic = true;
    dates = "weakly";
    options = "--delete-older-than 7d";
  };
}
