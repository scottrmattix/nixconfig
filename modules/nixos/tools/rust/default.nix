{inputs,...}:
{lib, config, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
	rustup
	];
}
