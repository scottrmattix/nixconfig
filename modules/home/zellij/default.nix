{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };
  home.packages = with pkgs; [
    skim
  ];
  xdg.configFile = {
    "zellij/config.kdl".source = ./config.kdl;
    "zellij/layouts".source = ./layouts;
  };
}
