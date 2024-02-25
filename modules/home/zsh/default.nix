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
    syntaxHighlighting.enable = true;
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

  home.packages = with pkgs; [
    ripgrep
  ];
  programs.dircolors = {
    enable = true;
  };
}
