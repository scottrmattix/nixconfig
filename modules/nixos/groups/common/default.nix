{inputs,...}:
{lib, config, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
	htop
	neofetch
	pandoc
	home-manager
	fd
	];
	imports = with inputs.self.nixosModules; [ 
	core
	openssh
	fonts
	];
}
