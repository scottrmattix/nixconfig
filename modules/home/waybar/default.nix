{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
  };
  xdg.configFile."waybar/config" = {
    source = ./config;
  };
}
