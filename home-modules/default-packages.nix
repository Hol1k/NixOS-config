{ pkgs, ... }:

{
  home.packages = with pkgs; [
	neovim
	ghostty
	fastfetch
	kdePackages.dolphin
	obsidian
	telegram-desktop
	discord
	ticktick
	libreoffice

	unityhub

	polkit_gnome
	noto-fonts-color-emoji
  ];
}
