{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  home = {
    username = "scottm";
    homeDirectory = "/home/scottm";
  };
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  profiles = {
    git.enable = true;
    zsh.enable = true;
    wezterm.enable = true;
    starship.enable = true;
    zellij.enable = true;
    helix.enable = true;
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.stateVersion = "23.11";
}
