inputs @ {nixpkgs, ...} : {
	nixos = nixpkgs.lib.nixosSystem{
		system = "x86-64_linux";
		modules = [
			./nixos
		];
	};
}
