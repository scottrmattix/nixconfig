{inputs,...}:
{lib, config, pkgs, ...}:
{
	programs.nix-ld.enable = true;
	environment.systemPackages = with pkgs; [
	htop
	neofetch
	pandoc
	home-manager
	fd
	nvfetcher
	steam-run
	];
	programs.light.enable = true;
	imports = with inputs.self.nixosModules; [ 
	core
	openssh
	fonts
	];
}
