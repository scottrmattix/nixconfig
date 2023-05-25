{inputs,...}:
{config,pkgs,lib,...}:
{
profiles = {
  services.xserver.enable = true;
};
  profiles.desktops.displaymanagers.lightdm.enable = true;
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      rofi
      polybar
      networkmanagerapplet
      i3lock-fancy-rapid
    ];
  };
  services = {
    picom.enable = true;
  };
}
