{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.thunderbird = {
    enable = true;
    profiles = {
      "scottm" ={
        isDefault = true;
      };
    };
  };
}
