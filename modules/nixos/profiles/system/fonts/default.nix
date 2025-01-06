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
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      jetbrains-mono
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
    fontDir.enable = true;
    enableDefaultPackages = true;
  };
}
