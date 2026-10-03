{ pkgs, ... }:

{
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
	git
	micro
	neovim
	iptables
	wget
	gawk
	man
	tree
  ];
}
