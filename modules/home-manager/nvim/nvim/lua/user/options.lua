local options = {
	relativenumber = true,
	number = true,



	showmatch = true,
	incsearch = true,
	hlsearch = false,


	mouse = "a",


	softtabstop = 2,
	shiftwidth = 2,
	tabstop = 2,
	smarttab = true,
	autoindent = true,


	updatetime = 50,


	scrolloff = 8
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.mapleader = " "
