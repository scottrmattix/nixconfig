{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  profiles = {
    # desktops.displaymanagers.gdm.enable = true;
    system.wayland.enable = true;
  };
  services.xserver.displayManager.sddm = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    grim
    slurp
  ];
  services.desktopManager.plasma6.enable = true;
}
