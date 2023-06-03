{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  profiles.desktops.displaymanagers.gdm.enable = true;
  environment.systemPackages = with pkgs; [
    rofi-wayland
  ];
  xdg.portal.wlr.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
