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
    rustc
    cargo
    rustfmt
    clippy
  ];
}
