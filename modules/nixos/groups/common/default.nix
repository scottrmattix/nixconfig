{inputs,...}:
{lib, config, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
	htop
	neofetch
	pandoc
	home-manager
	];
	imports = with inputs.self.nixosModules; [ 
	core
	openssh
	];
}
