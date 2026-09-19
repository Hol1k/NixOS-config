{ config, pkgs, ... }:

{
  hardware.graphics = {
	enable = true;
	enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
  	modesetting.enable = true;

  	powerManagement.enable = false;
  	powerManagement.finegrained = false;

	# false if is less then 16xx series
  	open = true;

  	nvidiaSettings = true;

  	package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.sessionVariables = {
  	GBM_BACKEND = "nvidia-drm";
  	__GLX_VENDOR_LYBRARY_NAME = "nvidia";

  	NIXOS_OZONE_WL = "1";

  	WLR_NO_HARDWARE_CURSORS = "1";
  };
}
