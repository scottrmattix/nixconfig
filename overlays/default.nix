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
        unstable = import inputs.unstable {
          inherit system;
          config.allowUnfree = true;
        };
        fcitx-engines = prev.fcitx5;
        # eww-wayland = inputs.eww.packages.x86_64-linux.eww-wayland;
      };
    };
  };
}
