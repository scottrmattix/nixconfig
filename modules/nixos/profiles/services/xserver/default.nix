{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    libinput = {
      enable = true;
      mouse = {
        naturalScrolling = false;
      };
      touchpad = {
        naturalScrolling = true;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    xclip
    xsel
  ];
}
