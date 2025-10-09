return {
    "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>o", "<cmd>Outline!<CR>", desc = "Toggle outline" },
  },
  opts = {
	  outline_window = {
		  position = 'left',
	    width = 20,
      show_relative_numbers = true,
    },
  },
}
