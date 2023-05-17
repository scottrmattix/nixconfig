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
	rust = import ./tools/rust;
	#system
	power = import ./system/power;
	fonts = import ./system/fonts;
}
