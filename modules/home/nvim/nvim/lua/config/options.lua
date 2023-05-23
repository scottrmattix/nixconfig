local options = {
	relativenumber = true,
	number = true,

	showmatch = true,
	incsearch = true,
	hlsearch = false,

	mouse = "a",

	softtabstop = 2,
	shiftwidth = 2,
	tabstop = 4,
	smarttab = true,
	autoindent = true,
	expandtab = true,

	updatetime = 50,

	scrolloff = 8,

	foldenable = false,
	editorconfig = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
