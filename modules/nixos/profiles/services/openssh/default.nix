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
    settings = {
      permitRootLogin = "no";
      passwordAuthentication = false;
    };
  };
}
