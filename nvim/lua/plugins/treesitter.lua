return {
  "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
  opts = function()
    local config = require('nvim-treesitter.configs')
    config.setup {
      ensure_installed = { "c", "lua", "vim", "markdown", "markdown_inline"},
      sync_install = true,
      auto_install = false,
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Leader>v",
          node_incremental = "<Leader>vv",
          scope_incremental = "<Leader>vs",
          node_decremental = "<Leader>vm",
        },
      },
      indent = {
        enable = true,
      },
    }
  end,
}
