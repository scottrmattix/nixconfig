{inputs,...}:
{lib,config,pkg,...}:
{
	xdg.configFile."./nvim/" = {
		source = ./nvim;
		recursive = true;
	};
}
