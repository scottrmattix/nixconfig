inputs @ {nixpkgs, ...} : {
	nixos = nixpkgs.lib.nixosSystem{
		system = "x86_64-linux";
		modules = [
			./nixos
		];
	};
}
