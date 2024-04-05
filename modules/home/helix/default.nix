{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs;[
          clang-tools
          rust-analyzer
          nil
          pyright
          gopls
          ltex-ls
          lua-language-server
          nodePackages.bash-language-server
          nodePackages.typescript-language-server
    ];
  };
  xdg.configFile = {
    "helix/config.toml".source = ./config.toml;
  };
}
