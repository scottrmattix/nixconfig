{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      format = ''
        [┌>](bold blue) $time$jobs[|](bold blue) $all[│](bold blue)$directory
        $character
      '';
      add_newline = false;
      scan_timeout = 10;
      character = {
        success_symbol = "[└─>](bold green)";
        error_symbol = "[└─>](bold red)";
        vimcmd_symbol = "[│](bold green)";
        vimcmd_replace_one_symbol = "[│](bold purple)";
        vimcmd_replace_symbol = "[│](bold purple)";
        vimcmd_visual_symbol = "[│](bold yellow)";
      };
      time = {
        format = "[\\[[$time]($style)\\]](bold cyan) ";
        disabled = false;
      };
    };
  };
}
