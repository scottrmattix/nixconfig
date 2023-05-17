{inputs,...}:
builtins.mapAttrs (name: value: value {inherit inputs;})
{
	git = ./git
}
