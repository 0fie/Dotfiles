{
  description = "0fie's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors = {
      url = "github:misterio77/nix-colors";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
  {
    nixosConfigurations = {
      "NixOS" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./system/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
		inherit (inputs.nix-colors.lib-contrib) gtkThemeFromScheme
		inputs
		nixvim;
	      };
              users.me = import ./home/home.nix;
            };
          }
	];
      };
    };
  };
}
