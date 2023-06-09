{
  inputs,
  self,
}: {
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
  programs.xwayland.enable = true;
}
