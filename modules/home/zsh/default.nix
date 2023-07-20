{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
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
    initExtra = ''
      unsetopt beep
    '';
  };
  programs.dircolors = {
    enable = true;
  };
}
