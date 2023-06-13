{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.eww = {
    enable =true;
    package = pkgs.eww-wayland;
    configDir = ./eww-config;
  };
  home.packages = with pkgs;[
    libnotify
    socat
    jq
  ];
}
