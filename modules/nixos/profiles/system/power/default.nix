{
  inputs,
  self,
}: {
  lib,
  config,
  pkgs,
  ...
}: {
  powerManagement = {
    enable = true;
    powertop = {
      enable = true;
    };
  };
  environment.systemPackages = [
    pkgs.powertop
  ];
}
