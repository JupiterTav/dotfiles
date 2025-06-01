return {
  "mason-org/mason.nvim",
  opts = {},
    dependencies = {
      { 
          "mason-org/mason-lspconfig.nvim",
          opts = {
              ensure_installed = { "clangd", "lua_ls"},
              automatic_installation = false,

           },
      },
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
    },
}
