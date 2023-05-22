{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ls = "ls --color=auto";
      grep = "rg";
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
    };
  };
  programs.dircolors = {
    enable = true;
  };
}