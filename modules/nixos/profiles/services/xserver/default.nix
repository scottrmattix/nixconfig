{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "us";
    };
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
