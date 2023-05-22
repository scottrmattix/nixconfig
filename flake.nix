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
		nur = {
			url = "github:nix-community/NUR";
		};

	};
	outputs =   {self, nixpkgs, unstable, home-manager, nur,...} @ inputs : 
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs {
			inherit system;
		};
		modpkgs = ({config, pkgs, ...}: {
				nixpkgs.overlays = [
				self.overlays.unstable-overlay
				self.overlays.nur-overlay
				];
		});

	in
	{
		overlays = import ./overlays {inherit inputs;};

		nixosModules = import ./modules/nixos {inherit inputs;};

		homeManagerModules = import ./modules/home-manager {inherit inputs;};

		nixosConfigurations = {
			cirrus = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs; };
				modules = [ 
				modpkgs
				self.nixosModules.common
				self.nixosModules.development
				self.nixosModules.power
				./nixos/cirrus/configuration.nix 
				];
			};
		};
		homeConfigurations = {
			scottm = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = {inherit inputs; };
				modules = [
				self.homeManagerModules.nvim
				self.homeManagerModules.starship
				self.homeManagerModules.zsh
				self.homeManagerModules.git
				self.homeManagerModules.wezterm
				./home-manager/scottm/home.nix 
				];
			};
		};
	};
}
