return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
    dependencies = {
      {
          "mason-org/mason.nvim",
          opts = {
              ensure_installed = {
                "clangd",
                "lua_ls"
              },
              automatic_installation = true,

            },
          lazy = true,
      },
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
      {
          "aznhe21/actions-preview.nvim",
          config = function()
            vim.keymap.set({ "v", "n" }, "gf", require("actions-preview").code_actions)
          end,
      },
    },
 }
