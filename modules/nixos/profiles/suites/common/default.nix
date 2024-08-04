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
    pandoc
    home-manager
    fd
    nvfetcher
    keepassxc
    socat
    jq
    nix-index
    lsof
    logseq
    steam-run
    man-pages
    man-pages-posix
    just
    tcpdump
    python3
    poppler_utils
    zip
    unzip
  ];
  profiles = {
    suites.core.enable = true;
    services = {
      openssh.enable = true;
    };
    system.fonts.enable = true;
  };
}
