{inputs,...}:
builtins.mapAttrs (name: value: value {inherit inputs;})
{
	#groups
	common = import ./groups/common;
	core = import ./groups/core;
	development = import ./groups/development;

	#services
	openssh = import ./services/openssh;
	#tools
	c = import ./tools/c;
	#system
	power = import ./system/power;
}
