---@diagnostic disable: undefined-doc-name
return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets',
    { 'onsails/lspkind.nvim', lazy = true }
  },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config

  opts = {
    snippets = {
      preset = 'luasnip'
    },
      keymap = {
        preset = 'enter',
        ['<Tab>'] = {
                      'select_next', 'fallback'},
        ['<S-Tab>'] = {'select_prev', 'fallback'},
        ['<Enter>'] = {
          'accept', 'fallback'},
      },
    appearance = {
        nerd_font_variant = 'mono'
      },
    completion = {
      documentation = {
        auto_show = false
      },

      list = {
        selection = {
          preselect = true,
          auto_insert = false
          },
      },

      ghost_text = {
        enabled = false,
        show_with_menu = false,
      },

      trigger = {
        show_on_insert_on_trigger_character = true,
        show_on_x_blocked_trigger_characters = {
            "'", '"', '(', '{', '['
        }
      },

      menu = {
        auto_show = true,
        auto_show_delay_ms = 600,
        draw = {
          treesitter = {'lsp'},
          columns = { {"kind_icon"}, { "label", gap = 1} },
          components = {
            label = {
              text = function (ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function (ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end
            },

            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons")
                                                    .get_icon(ctx.label)
                    if dev_icon then
                        icon = dev_icon
                    end
                else
                    icon = require("lspkind").symbolic(ctx.kind, {
                        mode = "symbol",
                    })
                end
                return icon .. ctx.icon_gap
              end,

              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons")
                                                      .get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end
              },
            },
          },
          direction_priority = function()
            local ctx = require('blink.cmp').get_context()
            local item = require('blink.cmp').get_selected_item()
            if ctx == nil or item == nil then return { 's', 'n' } end

            local item_text = item.textEdit ~= nil and item.textEdit.newText or item.insertText or item.label
            local is_multi_line = item_text:find('\n') ~= nil

            -- after showing the menu upwards, we want to maintain that direction
            -- until we re-open the menu, so store the context id in a global variable
            if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
              vim.g.blink_cmp_upwards_ctx_id = ctx.id
              return { 'n', 's' }
            end
            return { 's', 'n' }
          end
        },
     },
    sources = {
      default = function (ctx)
       local success, node = pcall(vim.treesitter.get_node)
       if success and node and vim.tbl_contains({'comment', 'line_comment', 'block_comment'}, node:type()) then
         return {'buffer'}
        elseif vim.bo.filetype == 'lua' then
         return {'lsp', 'path'}
        else
          return {'lsp', 'path', 'snippets', 'buffer'}
        end
      end,
      providers = {
        snippets = {
          should_show_items = function(ctx)
            return ctx.trigger.initial_kind ~= 'trigger_character'
          end,
        },
        buffer = {
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ''
              end, vim.api.nvim_list_bufs())
            end
          },
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = {
        'score',
        'sort_text',
        'exact',
      },
    },
    signature = {
      enabled = false,
      window = {
        show_documentation = true,
      },
    },
  },
}
