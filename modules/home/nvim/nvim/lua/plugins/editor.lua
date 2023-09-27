local guess_indent_spec = use("NMAC427/guess-indent.nvim", {
  config = function()
    require("guess-indent").setup({
      filetype_exclude = {
        "NvimTree",
        "FTerm",
      },
    })
  end,
})

return {
  guess_indent_spec,
}
