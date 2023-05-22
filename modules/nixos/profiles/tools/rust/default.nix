{inputs,self}:
{lib, config, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
	rustup
	];
}
