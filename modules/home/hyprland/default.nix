{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    # recommendedEnvironment = true;
  };
  xdg.configFile."hypr/hyprland.conf" = {
    source = ./hyprland.conf;
  };
  home.packages = with pkgs; [
    dunst
  ];
  profiles.eww.enable = true;
}
