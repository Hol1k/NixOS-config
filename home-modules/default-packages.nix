{ pkgs, ... }:

{
  home.packages = with pkgs; [
	neovim
	ghostty
	fastfetch
	kdePackages.dolphin
	obsidian
	telegram-desktop

	polkit_gnome
	noto-fonts-color-emoji
  ];
}
