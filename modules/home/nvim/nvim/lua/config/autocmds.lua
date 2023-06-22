local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufEnter, BufWinEnter"}, {pattern = {"*.norg"}, command = "set conceallevel=3"})
