{
  description = "Моя конфигурация NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
    	url = "github:nix-community/home-manager";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [        
          ./hardware-configuration.nix
          ./configuration.nix

          ./modules/system-packages.nix
          ./modules/xdg.nix
          ./modules/wayland-nvidia.nix
          ./modules/polkit.nix
          ./modules/throne.nix
          
          ./modules/services/pipewire.nix

          home-manager.nixosModules.home-manager {
          	home-manager.useGlobalPkgs = true;
          	home-manager.useUserPackages = true;
          	home-manager.users.hol1k = import ./home.nix;
          }
        ];
      };
    };
  };
}
