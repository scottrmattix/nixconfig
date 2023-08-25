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
    git
    wget
    ripgrep
    curl
    vim
    binutils
  ];
}
