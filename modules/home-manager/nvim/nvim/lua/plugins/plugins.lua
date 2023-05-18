return {
	{
		"nvim-lua/plenary.nvim"
	},

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
      }
    end,
  },


  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
  },
}
