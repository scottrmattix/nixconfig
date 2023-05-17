{inputs,...}:
builtins.mapAttrs (name: value: value {inherit inputs;})
{
	starship = import ./starship;
	zsh = import ./zsh;
	wezterm = import ./wezterm;
	git = import ./git;
}
