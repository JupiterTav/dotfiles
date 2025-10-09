return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
    dependencies = {
      {
          "mason-org/mason.nvim",
          opts = {
              ensure_installed = { "clangd", "lua_ls"},
              automatic_installation = false,
            },
          lazy = true,
      },
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
    },
}
