return {
  'romgrk/barbar.nvim',
    version = '^1.*', -- optional: only update when a new 1.x version is released
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        animation = true,
        insert_at_start = true,
        tabpages = true,
        separator_at_end = true,
        clickable = true,
        focus_on_close = 'left',
        highlight_alternate = false,
        highlight_inactive_file_icons = true,
        highlight_visible = true,
        icons = {
          buffer_index = true,
          buffer_number = false,
          button = '',
    -- Enables / disables diagnostic symbols
          diagnostics = {
            [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
            [vim.diagnostic.severity.WARN] = {enabled = false},
            [vim.diagnostic.severity.INFO] = {enabled = false},
            [vim.diagnostic.severity.HINT] = {enabled = true},
          },
          gitsigns = {
            added = {enabled = true, icon = '+'},
            changed = {enabled = true, icon = '~'},
            deleted = {enabled = true, icon = '-'},
          },
        },
      }
  }
