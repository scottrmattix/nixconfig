{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  profiles = {
    desktops.displaymanagers.gdm.enable = true;
    system.wayland.enable = true;
  };
  services.xserver.displayManager.gdm = {
    wayland = true;
  };
  environment.systemPackages = with pkgs; [
    wofi
    wlogout
    swaybg
    swaylock
    wlr-randr
  ];
  programs.light.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
