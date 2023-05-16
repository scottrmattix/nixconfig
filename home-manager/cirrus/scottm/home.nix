{inputs, lib, config, pkgs, ...}:
{
  imports = [
  ];
  home = {
    username = "scottm";
    homeDirectory = "/home/scottm";
  };
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
