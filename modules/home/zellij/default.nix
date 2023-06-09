{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      pane_frames = false;
    };
  };
}
