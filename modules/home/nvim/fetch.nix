let
  plugin = owner: repo: fetch owner repo {};

  fetch = owner: repo: {
    rev ? null,
    branch ? null,
    isPlugin ? true, # Disable for Treesitter grammars
  }: let
    pname =
      if isPlugin
      then "'plugin-${repo}'"
      else repo;
    repository = "${owner}/${repo}";
    src =
      if rev != null
      then {
        "src.manual" = rev;
      }
      else if branch != null
      then {
        "src.git" = "https://github.com/${repository}";
        "src.branch" = branch;
      }
      else {
        "src.git" = "https://github.com/${repository}";
      };
  in {
    name = pname;
    value =
      src
      // {
        "fetch.github" = "${repository}";
      };
  };
in
  builtins.listToAttrs [
    # Vitals
    (plugin "folke" "lazy.nvim")
    (plugin "nvim-lua" "plenary.nvim")

    # Editor tooling
    (plugin "neovim" "nvim-lspconfig")
    (plugin "jose-elias-alvarez" "null-ls.nvim")
    (plugin "ray-x" "lsp_signature.nvim")
    (plugin "hrsh7th" "nvim-cmp")
    (plugin "hrsh7th" "cmp-nvim-lsp")
    (plugin "hrsh7th" "cmp-path")
    (plugin "hrsh7th" "cmp-omni")
    (plugin "hrsh7th" "cmp-calc")
    (plugin "hrsh7th" "cmp-buffer")
    (plugin "hrsh7th" "cmp-cmdline")
    (plugin "rcarriga" "cmp-dap")
    (plugin "L3MON4D3" "LuaSnip")
    (plugin "saadparwaiz1" "cmp_luasnip")
    (plugin "rafamadriz" "friendly-snippets")
    (plugin "onsails" "lspkind-nvim")
    (plugin "iurimateus" "luasnip-latex-snippets.nvim")

    # Specialized windows
    (plugin "nvim-tree" "nvim-tree.lua")
    (plugin "nvim-telescope" "telescope.nvim")
    (plugin "folke" "trouble.nvim")
    (plugin "numToStr" "FTerm.nvim")
    (plugin "MunifTanjim" "nui.nvim")
    (fetch "j-hui" "fidget.nvim" {branch = "legacy";})

    # Text editing assistance/annotations
    (plugin "NMAC427" "guess-indent.nvim")
    (plugin "echasnovski" "mini.surround")
    (plugin "tpope" "vim-repeat")
    (plugin "numToStr" "Comment.nvim")
    (plugin "windwp" "nvim-autopairs")
    (plugin "monaqa" "dial.nvim")
    (plugin "sQVe" "sort.nvim")
    (plugin "booperlv" "nvim-gomove")
    (plugin "ggandor" "leap.nvim")

    # UNIX/Git commands
    (plugin "tpope" "vim-eunuch")
    (plugin "lewis6991" "gitsigns.nvim")
    (plugin "sindrets" "diffview.nvim")

    # Appearance/Theming
    (plugin "rmehri01" "onenord.nvim")
    (plugin "nvim-treesitter" "nvim-treesitter")
    (plugin "nvim-treesitter" "nvim-treesitter-textobjects")
    (plugin "nvim-treesitter" "nvim-treesitter-refactor")
    # Treesitter queries will be synced with the nixpkgs treesitter input
    (plugin "nvim-treesitter" "playground")
    (plugin "windwp" "nvim-ts-autotag")
    (plugin "JoosepAlviste" "nvim-ts-context-commentstring")
    (plugin "nvim-lualine" "lualine.nvim")
    (plugin "nvim-tree" "nvim-web-devicons")
    (plugin "lukas-reineke" "indent-blankline.nvim")
    (plugin "kosayoda" "nvim-lightbulb")
    (plugin "NvChad" "nvim-colorizer.lua")
    (plugin "rktjmp" "lush.nvim")
    (plugin "rktjmp" "highlight-current-n.nvim")
    (plugin "kevinhwang91" "nvim-ufo")
    (plugin "kevinhwang91" "promise-async")

    # Special Neovim sauce
    (plugin "andweeb" "presence.nvim")
    (plugin "folke" "which-key.nvim")
    (plugin "ahmedkhalf" "project.nvim")
    (plugin "samjwill" "nvim-unception")

    # Debugging
    (plugin "mfussenegger" "nvim-dap")
    (plugin "rcarriga" "nvim-dap-ui")
    (plugin "theHamsta" "nvim-dap-virtual-text")
    (plugin "jbyuki" "one-small-step-for-vimkind")
    (plugin "leoluz" "nvim-dap-go")
    (plugin "mfussenegger" "nvim-dap-python")

    # Language-specific plugins
    (plugin "folke" "neodev.nvim")
    (plugin "simrat39" "rust-tools.nvim")
    (plugin "MrcJkb" "haskell-tools.nvim")
    (plugin "lervag" "vimtex")
    (plugin "barreiroleo" "ltex_extra.nvim")

    (fetch "IndianBoy42" "tree-sitter-just" {isPlugin = false;})
    #neorg
    (plugin "nvim-neorg" "neorg")
    (plugin "nvim-neorg" "neorg-telescope")
    (fetch "nvim-neorg" "tree-sitter-norg" {
      branch = "dev";
      isPlugin = false;
    })
    (fetch "nvim-neorg" "tree-sitter-norg-meta" {isPlugin = false;})
  ]
