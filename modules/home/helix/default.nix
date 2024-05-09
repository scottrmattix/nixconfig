{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;
    extraPackages = with pkgs; [
      clang-tools
      rust-analyzer
      nil
      pyright
      gopls
      ltex-ls
      lua-language-server
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages.svelte-language-server
      taplo
      alejandra
    ];
    languages = {
      language = with pkgs; [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "${alejandra}/bin/alejandra";
            args = ["-q" "-q" "-"];
          };
        }
        {
          name = "svelte";

          block-comment-tokens = {
            start = "<!--";
            end = "-->";
          };
        }
      ];
    };
  };
  xdg.configFile = {
    "helix/config.toml".source = ./config.toml;
  };
}
