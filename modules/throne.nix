{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.throne
  ];

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
}
