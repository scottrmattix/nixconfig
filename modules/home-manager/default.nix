{inputs,...}:
builtins.mapAttrs (name: value: value {inherit inputs;})
{
	nvim = import ./nvim;
	starship = import ./starship;
	zsh = import ./zsh;
	wezterm = import ./wezterm;
	git = import ./git;
}
