{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  profiles.services.xserver.enable = true;
  services.xserver.displayManager = {
    gdm = {
      enable = true;
      wayland = true;
    };
  };
}
