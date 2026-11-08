{ config, pkgs, ... }:

{
  swapDevices = [
    {
      device = "/swapfile";
      size = 4096;
    }
  ];

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
  };
}
