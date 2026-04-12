return {
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
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
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
		require("koda").setup({
			transparent = false,
			auto = true,
			cache = true,

      theme = {
        dark = "dark",
        light = "light"
      }
		})        -- require("koda").setup({ transparent = true })
      end,
  }
}
