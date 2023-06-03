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
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
