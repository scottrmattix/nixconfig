local lualine_spec = use("nvim-lualine/lualine.nvim", {
  event = "BufEnter",
})

lualine_spec.config = function()
  local lualine = require("lualine")
  lualine.setup()
end

return {
  lualine_spec,
}
