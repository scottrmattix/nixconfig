{inputs,self}:
{lib, config, pkgs, ...}:
{
  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [
  htop
  neofetch
  pandoc
  home-manager
  fd
  nvfetcher
  steam-run
  ];
  programs.light.enable = true;
  profiles.suites.core.enable = true;
  profiles.services.openssh.enable = true;
  profiles.system.fonts.enable = true;
}
