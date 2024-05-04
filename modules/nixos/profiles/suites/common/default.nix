{
  inputs,
  self,
}: {
  lib,
  config,
  pkgs,
  ...
}: {
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
    zathura
    socat
    jq
    nix-index
    lsof
    logseq
    steam-run
    man-pages
    man-pages-posix
    just
  ];
  profiles = {
    suites.core.enable = true;
    services = {
      openssh.enable = true;
    };
    system.fonts.enable = true;
  };
}
