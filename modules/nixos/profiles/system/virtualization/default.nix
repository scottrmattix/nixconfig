{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [virt-manager qemu];
}
