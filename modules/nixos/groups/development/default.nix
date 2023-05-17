{inputs,...}:
{lib, config, pkgs,...}:
{
	imports = with inputs.self.nixosModules; [
		c 
		rust
	];
}
