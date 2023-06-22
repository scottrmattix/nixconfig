local neorg_spec = use("nvim-neorg/neorg", {
  dependencies = {
    use("nvim-lua/plenary.nvim"),
    use("nvim-neorg/neorg-telescope"),
    use("nvim-treesitter/nvim-treesitter"),
  },
  ft = "norg",
  cmd = { "Neorg" },
})

neorg_spec.config = function()
  local wk = require("which-key")

  local neorg = require("neorg")
  local config = require("neorg.config")

  neorg.setup({
    load = {
      ["core.defaults"] = {},
      ["core.qol.toc"] = {},
      ["core.looking-glass"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            general = "~/neorg/general",
          },
          autochdir = true,
          index = "index.norg",
          default_workspace = "general",
        },
      },
      ["core.summary"] = {},
      ["core.esupports.metagen"] = {
        config = {
          type = "empty",
          tab = "",
          template = {
            {
              "title",
              function()
                return vim.fn.expand("%:p:t:r")
              end,
            },
            { "description", "" },
            { "authors", "Scott Mattix" },
            { "categories", "" },
            { "version", config.version },
          },
        },
      },
      ["core.export"] = {},
      ["core.journal"] = {
        config = {
          journal_folder = "journal",
          strategy = "nested",
          workspace = "general",
        },
      },
      ["core.concealer"] = {
        config = {
          icon_preset = "diamond",
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.keybinds"] = {
        config = {
          hook = function()
            wk.register({
              t = {
                name = "Tasks",
                c = "Mark task canceled",
                d = "Mark task done",
                h = "Mark task on hold",
                i = "Mark task important",
                p = "Mark task pending",
                r = "Mark task recurring",
                u = "Mark task undone",
              },

              n = "New note",
              p = { "<cmd>Neorg presenter start<CR>", "Start presenter" },
              c = { "<cmd>Neorg toggle-concealer<CR>", "Toggle concealer" },

              h = {
                name = "Hop",
                g = "Open link",
                v = "Open link in vsplit",
              },

              j = "Next heading",
              k = "Previous heading",

              l = {
                name = "List type",
                i = "Invert list type",
                t = "Toggle list type",
              },
              m = "Looking glass",
            }, {
              prefix = "<LocalLeader>",
              bufnr = 0,
            })

            wk.register({
              [">"] = {
                ["."] = "Promote",
                [">"] = "Promote nested",
              },
              ["<"] = {
                [","] = "Demote",
                ["<"] = "Demote nested",
              },
            })
          end,
          keybind_presets = {
            neorg = function(keybinds)
              -- This is a slightly misleading name; it's the localleader key.
              local leader = keybinds.leader

              -- Map all the below keybinds only when the "norg" mode is active
              keybinds.map_event_to_mode("norg", {
                n = {
                  { leader .. "tc", "core.qol.todo_items.todo.task_cancelled" },
                  { leader .. "td", "core.qol.todo_items.todo.task_done" },
                  { leader .. "th", "core.qol.todo_items.todo.task_on_hold" },
                  { leader .. "ti", "core.qol.todo_items.todo.task_important" },
                  { leader .. "tp", "core.qol.todo_items.todo.task_pending" },
                  { leader .. "tr", "core.qol.todo_items.todo.task_recurring" },
                  { leader .. "tu", "core.qol.todo_items.todo.task_undone", "Mark task undone" },

                  { leader .. "n", "core.dirman.new.note" },

                  { leader .. "hg", "core.esupports.hop.hop-link" },
                  { leader .. "hv", "core.esupports.hop.hop-link", "vsplit" },

                  { leader .. "j", "core.integrations.treesitter.next.heading" },
                  { leader .. "k", "core.integrations.treesitter.previous.heading" },

                  { ">.", "core.promo.promote" },
                  { "<,", "core.promo.demote" },
                  { ">>", "core.promo.promote", "nested" },
                  { "<<", "core.promo.demote", "nested" },

                  { leader .. "lt", "core.pivot.toggle-list-type" },
                  { leader .. "li", "core.pivot.invert-list-type" },

                  { leader .. "m", "core.looking-glass.magnify-code-block" },
                  { leader .. "s", "core.summary.summarize" },
                },

                i = {
                  { "<C-l>", "core.integrations.telescope.insert_link" },
                  { "<C-t>", "core.promo.promote" },
                  { "<C-d>", "core.promo.demote" },
                  { "<M-CR>", "core.itero.next-iteration" },
                },
              }, {
                silent = true,
                noremap = true,
              })

              keybinds.map_event_to_mode("toc-split", {
                n = {
                  { "hg", "core.qol.toc.hop-toc-link" },
                  { "q", "core.qol.toc.close" },
                  { "<Esc>", "core.qol.toc.close" },
                },
              }, {
                silent = true,
                noremap = true,
                nowait = true,
              })

              -- Map the below keys on presenter mode
              keybinds.map_event_to_mode("presenter", {
                n = {
                  { "<CR>", "core.presenter.next_page" },
                  { "l", "core.presenter.next_page" },
                  { "h", "core.presenter.previous_page" },

                  { "q", "core.presenter.close" },
                  { "<Esc>", "core.presenter.close" },
                },
              }, {
                silent = true,
                noremap = true,
                nowait = true,
              })
            end,
          },
        },
      },
    },
  })
end

return {
  neorg_spec,
}
