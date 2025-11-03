local leet_arg = "leetcode.nvim"
return{
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    lazy = leet_arg ~= vim.fn.argv(0, -1),
    dependencies = {
        -- include a picker of your choice, see picker section for more details
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
      arg = leet_arg,

    },
}
