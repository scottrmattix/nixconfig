{
  inputs,
  self,
}: {
  config,
  lib,
  pkgs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      jetbrains-mono
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
    fontDir.enable = true;
    enableDefaultPackages = true;
  };
}
