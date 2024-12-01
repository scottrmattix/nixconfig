{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    package = pkgs.unstable.zellij;
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
