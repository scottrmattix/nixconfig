{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    systemdIntegration = true;
    recommendedEnvironment = true;
  };
  xdg.configFile."hypr/hyprland.conf" = {
    source = ./hyprland.conf;
  };
  home.packages = with pkgs;[
    dunst
  ];
  profiles.waybar.enable = true;
  profiles.eww.enable = true;
}
