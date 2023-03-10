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
		nix-ld = {
			url = "github:Mic92/nix-ld";
			follows = "unstable";
		};
	};
	outputs = inputs @ {self, nixpkgs, unstable, home-manager, nix-ld} : {
		nixosConfigurations = (
			import ./systems inputs
		);
	};
}
