{
	description = "My NixOS configuration";
	inputs = {
		nixpkgs = {
			url = "github:nixos/nixpkgs/nixos-22.11";
		};
		unstable = {
			url = "github:nixos/nixpkgs/nixos-unstable";
		};
		home-manager = {
			url = "github:nix-community/home-manager/release-22.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs =   {self, nixpkgs, unstable, home-manager} @ inputs : {
		overlays = import ./overlays {inherit inputs;};

		nixosModules = import ./modules/nixos {inherit inputs;};

		homeManagerModules = import ./modules/home-manager;

		nixosConfigurations = {
			cirrus = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs; };
				modules = [ 
				self.nixosModules.common
				self.nixosModules.development
				self.nixosModules.power
				./nixos/cirrus/configuration.nix 
				];
			};
		};
		homeConfigurations = {
			"scottm@cirrus" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				extraSpecialArgs = {inherit inputs; };
				modules = [
				self.homeManagerModules.git
				./home-manager/cirrus/scottm/home.nix 
				];
			};
		};
	};
}
