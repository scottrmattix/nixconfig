{inputs, ...}: {
  pkgs,
  lib,
  ...
}: let
  #  inherit (pkgs.stdenv) isDarwin;
  genAttrs' = values: f: with lib; listToAttrs (map (v: nameValuePair (f v) v) values);
  sources = pkgs.callPackage _sources/generated.nix {};

  # Grammar builder function
  buildGrammar = pkgs.callPackage "${inputs.nixpkgs}/pkgs/development/tools/parsing/tree-sitter/grammar.nix" {};
  # Build grammars that were fetched using nvfetcher
  generatedGrammars = with lib;
    mapAttrs (n: v:
      buildGrammar {
        language = removePrefix "tree-sitter-" n;
        inherit (v) version src;
      }) (filterAttrs (n: _: hasPrefix "tree-sitter-" n) sources);

  # Attrset of grammars built using nvim-treesitter's lockfile
  grammars' = with lib;
    genAttrs' pkgs.vimPlugins.nvim-treesitter.withAllGrammars.passthru.dependencies
    (v: replaceStrings ["vimplugin-treesitter-grammar-"] ["tree-sitter-"] v.name);
  grammars = grammars' // generatedGrammars;

  parserDir = with lib;
    pkgs.linkFarm
    "treesitter-parsers"
    (mapAttrsToList
      (n: v: let
        name = "${replaceStrings ["-"] ["_"] (removePrefix "tree-sitter-" n)}.so";
      in {
        inherit name;
        path =
          # nvim-treesitter's grammars are inside a "parser" directory, which sucks
          if hasPrefix "vimplugin-treesitter" v.name
          then "${v}/parser/${name}"
          else "${v}/parser";
      })
      grammars);

  buildPlugin = source:
    pkgs.vimUtils.buildVimPluginFrom2Nix {
      inherit (source) pname version src;
    };

  generatedPluginSources = with lib;
    mapAttrs'
    (n:
      nameValuePair
      (removePrefix "'plugin-" (removeSuffix "'" n)))
    (filterAttrs (n: _: hasPrefix "'plugin-" n)
      sources);

  generatedPlugins = with lib;
    mapAttrs (_: buildPlugin) generatedPluginSources;

  plugins =
    generatedPlugins
    // {
      inherit (pkgs.vimPlugins) nvim-treesitter nvim-treesitter-textobjects nvim-treesitter-refactor;
      "fidget.nvim" = generatedPlugins."fidget.nvim".overrideAttrs (_: {
        patches = [./fidget.patch];
      });
      # Add plugins you want synced with nixpkgs here.
      # inherit (pkgs.vimPlugins) nvim-treesitter nvim-treesitter-textobjects nvim-treesitter-refactor;
      tree-sitter-just = buildPlugin sources.tree-sitter-just;
    };
in
  lib.mkMerge [
    {
      home.packages = with pkgs; [
        neovim-remote
      ];

      programs.neovim = {
        enable = true;
        #        package = pkgs.unstable.neovim;

        viAlias = true;
        vimAlias = true;

        withPython3 = true;

        extraPackages = with pkgs; [
          # Language servers
          pyright
          # python3.pkgs.python-lsp-server
          gopls
          ltex-ls
          lua-language-server
          nodePackages.bash-language-server
          nodePackages.typescript-language-server
          clang-tools
          rust-analyzer
          nil

          # null-ls sources
          alejandra
          asmfmt
          black
          cppcheck
          deadnix
          editorconfig-checker
          gofumpt
          gitlint
          mypy
          nodePackages.alex
          nodePackages.prettier
          nodePackages.markdownlint-cli
          python3Packages.flake8
          shellcheck
          shellharden
          shfmt
          statix
          stylua
          vim-vint

          # DAP servers
          delve
        ];
      };

      xdg.configFile = {
        "nvim/init.lua".source = ./nvim/init.lua;
        "nvim/lua".source = ./nvim/lua;
        "nvim/parser".source = "${parserDir}";
      };

      xdg.dataFile =
        {
          "nvim/vscode-lldb".source = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb";
        }
        // (with lib;
          mapAttrs' (n: v:
            nameValuePair "nvim/plugins/${n}" {
              source = "${v}";
            })
          plugins);
    }
  ]
