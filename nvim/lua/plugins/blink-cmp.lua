---@diagnostic disable: undefined-doc-name
return {
  'saghen/blink.cmp',
  dependencies = { 
    'saghen/blink.lib',
    'rafamadriz/friendly-snippets',
    {
      'onsails/lspkind.nvim',
      lazy = true
    },
     "mgalliou/blink-cmp-tmux"
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config,
  opts = {
    snippets = {
      preset = 'luasnip'
    },
      keymap = {
        preset = 'enter',
        ['<Tab>'] =  {function (cmp)
            if cmp.snippet_active({direction =1})  then
                    return cmp.snippet_forward()
            else
                return cmp.select_next()
           end
        end,
        'fallback'
    },
        ['<S-Tab>'] = { function (cmp)
           if cmp.snippet_forward({direction = -1}) then 
               return cmp.snippet_backward()
            else 
                return cmp.select_prev()
            end
        end,
        'fallback'
    },
        ['<Enter>'] = {
          'accept', 'fallback'},
      },
    appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = false,
      },
    completion = {
      documentation = {
        auto_show = false,
        window = {border ='rounded'},
      },

      list = {
        selection = {
          preselect = true,
          auto_insert = false
          },
      },
      ghost_text = {
        enabled = true,
        show_with_menu = false,
      },


      menu = {
        auto_show = true,
        auto_show_delay_ms = 250,
        border = "rounded",
        draw = {
            treesitter = {'lsp'},
            columns = {{ "label", "label_description", gap = 1}, {"kind_icon"}},
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
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                        icon = dev_icon
                    end
                else
                    icon = require("lspkind").symbol_map[ctx.kind] or ""
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
        },
     },
    sources = {
      default =  {'lsp', 'path', 'snippets', 'buffer', 'tmux', 'lazydev'},
      providers = {
        lsp = {
          enabled = true,
          score_offset = 0,
          module = 'blink.cmp.sources.lsp',
          should_show_items = true,
          async = false,

        },
        tmux = {
          module = "blink-cmp-tmux",
          name = "tmux"
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
        lazydev = {
          name= "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        snippets = {
            should_show_items = function(ctx)
              return ctx.trigger.initial_kind ~= 'trigger_character'
            end,
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust",
      sorts = {
        'score',
        'sort_text',
        'exact',
      },
    },
    signature = {
      enabled = true,
      window = {
        show_documentation = true,
        border = "bold",
      },
    },
  },
}
