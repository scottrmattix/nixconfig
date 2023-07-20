{
  self,
  inputs,
  lib,
  ...
}: let
  inherit (self.lib) importModulesWith;
in {
  flake = {
    overlays = {
      default = final: prev: let
        system = prev.system;
      in {
        stable = import inputs.stable {
          inherit system;
          config.allowUnfree = true;
        };
        nur = inputs.nur;
        fcitx-engines = prev.fcitx5;
        eww-wayland = inputs.eww.packages.x86_64-linux.eww-wayland;
      };
    };
  };
}
