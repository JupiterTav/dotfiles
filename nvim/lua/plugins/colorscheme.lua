return {
    {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
},
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      lazy = true,
      config = true,
      opts = {
          transparent_mode = false,
          terminal_colors = true,
          inverse = true,
          contrast = "hard",
        },
    },

    {
      "oskarnurm/koda.nvim",
      lazy = true, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
	    require("koda").setup({
		    transparent = false,
			auto = true,
			cache = true,

            theme = {
                dark = "dark",
                light = "light"
            },
            foreground = {
                dark = "saturated",
                light = "saturated"
            },
		})        -- require("koda").setup({ transparent = true })
      end,
  },

  {
    "saeeedhany/parchment.nvim",
    priority = 1000,
      lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
      lazy = true,
    priority = 1000,
  },
  {
    "webhooked/kanso.nvim",
    lazy = true,
    config = function ()
      foreground = {
        dark = "default"
      }
    end,
    priority = 1000,
  },
  {
  "ankushbhagats/pastel.nvim",
    lazy = true, -- disable lazy loading 
    priority = 1000, -- load immediately at startup
    opts = {}, -- your configuration comes here
    config = true -- call setup function with provided opts
  }
}
