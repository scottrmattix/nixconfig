{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  networking.wireless.iwd = {
    enable = true;
    package = pkgs.unstable.iwd;
    settings = {
      Settings = {
        AutoConnect = true;
      };
    };
  };
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };
}
