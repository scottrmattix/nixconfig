{
  inputs,
  self,
}: {
  pkgs,
  config,
  lib,
  ...
}: {
  services.jack = {
    jackd.enable = true;
    alsa.enable = true;
    loopback = {
      enable = true;
    };
  };
}
