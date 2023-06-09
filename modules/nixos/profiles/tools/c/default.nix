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
    gcc
    gnumake
    clang
    bear
    gdb
  ];
}
