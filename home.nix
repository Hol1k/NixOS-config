{ pkgs, ... }:

{
  home.username = "hol1k";
  home.homeDirectory = "/home/hol1k";
  home.stateVersion = "26.05";

  imports = [
  	./home-modules/default-packages.nix
  	
  	./home-modules/programs/git.nix
  	./home-modules/programs/firefox.nix
  	./home-modules/programs/rofi.nix
  	./home-modules/programs/jb-rider.nix
  	./home-modules/programs/unity-hub.nix
  	./home-modules/programs/zapret.nix

  	./home-modules/services/udiskie.nix

  	./home-modules/hyprland/hypr.nix
  	./home-modules/hyprland/waybar.nix
  	./home-modules/hyprland/dark-theme.nix
  	./home-modules/hyprland/pointer-cursor.nix

  	./home-modules/bash.nix
  	
  	./home-modules/session-variables.nix
  ];

  programs.home-manager.enable = true;
}
