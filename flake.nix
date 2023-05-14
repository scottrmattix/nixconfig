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
		nixosConfigurations = {
			cirrus = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs; };
				modules = [ ./nixos/cirrus/configuration.nix ];
			};
		};
	};
}
