return {
 "mason-org/mason.nvim",
   dependencies = {
       { 
           "mason-org/mason-lspconfig.nvim",
           opts = {
               ensure_installed = { "clangd", "lua_ls" }
           },
       },
       "neovim/nvim-lspconfig" 
   },
   opts = {},
--  config = function()
--       require("mason").setup()
--   end,
}
