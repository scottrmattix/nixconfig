{
  inputs,
  self,
}: {
  lib,
  config,
  pkgs,
  ...
}: {
  programs.nix-ld.enable = true;
  programs.light.enable = true;
  environment.systemPackages = with pkgs; [
    htop
    neofetch
    pandoc
    home-manager
    fd
    nvfetcher
    steam-run
    taskwarrior
    taskwarrior-tui
    keepassxc
    element-desktop
  ];
  profiles.suites.core.enable = true;
  profiles.services = {
    openssh.enable = true;
  };
  profiles.system.fonts.enable = true;
}
