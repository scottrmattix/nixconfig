local null_ls = require("null-ls")

null_ls.setup({
  on_attach = require("plugins.lsp.on_attach"),
  on_init = function(client, _) end,
  sources = {
    null_ls.builtins.formatting.asmfmt,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.latexindent.with({
      args = { "-l", "-" },
    }),
    -- null_ls.builtins.formatting.mix,
    null_ls.builtins.formatting.prettier,
    (function()
      if vim.env.USE_NIXPKGS_FMT == "1" then
        return null_ls.builtins.formatting.nixpkgs_fmt
      else
        return null_ls.builtins.formatting.alejandra
      end
    end)(),
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.shellharden,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.zigfmt,

    null_ls.builtins.diagnostics.alex,
    null_ls.builtins.diagnostics.chktex,
    null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.diagnostics.credo,
    null_ls.builtins.diagnostics.deadnix,
    null_ls.builtins.diagnostics.editorconfig_checker.with({ command = "editorconfig-checker" }),
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.gitlint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.statix,
    null_ls.builtins.diagnostics.vint,

    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.code_actions.statix,
  },
})
