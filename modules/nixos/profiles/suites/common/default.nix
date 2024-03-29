{
  inputs,
  self,
}: {
  lib,
  config,
  pkgs,
  ...
}: {
  services.wg-netmanager.enable = true;
  networking.wireguard.enable = true;
  programs.nix-ld = {
    enable = true;
  };
  documentation.dev.enable = true;
  environment.systemPackages = with pkgs; [
    file
    htop
    neofetch
    pandoc
    home-manager
    fd
    nvfetcher
    keepassxc
    taskwarrior
    taskwarrior-tui
    element-desktop
    zathura
    socat
    jq
    nix-index
    lsof
    logseq
    poppler_utils
    steam-run
    man-pages
    man-pages-posix
    just
    stable.mongodb-compass
  ];
  profiles.suites.core.enable = true;
  profiles.services = {
    openssh.enable = true;
  };
  profiles.system.fonts.enable = true;
}
