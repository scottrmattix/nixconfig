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
    grim
    slurp
    wofi
    wlogout
    swaybg
    swaylock
    wlr-randr
    mako
  ];
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  programs.light.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
  };
}
