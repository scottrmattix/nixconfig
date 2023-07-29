{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
  };
  xdg.configFile."zellij/config.kdl" = {
    source = ./config.kdl;
  };
}
