{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
    };
  };
}
