{
  inputs,
  self,
}: {
  pkgs,
  config,
  lib,
  ...
}: {
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };
}