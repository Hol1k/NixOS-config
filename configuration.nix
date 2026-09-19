{ config, lib, pkgs, ... }:

{
  boot.loader.grub = {
  	enable = true;
  	device = "nodev";
  	efiSupport = true;
  	useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Yekaterinburg";

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
  	experimental-features = [ "nix-command" "flakes" ];
  	substituters = [
  		"https://mirror.yandex.ru/nixos"
  		"https://cache.nixos.org"
  	];
  	trusted-public-keys = [
  		"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  	];
  };

  users.users.hol1k = {
  	isNormalUser = true;
  	extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  security.rtkit.enable = true;


  system.stateVersion = "26.05";

}

