return {
    'nvimdev/lspsaga.nvim',
    config = function ()
        require('lspsaga').setup({})
    end,
   dependencies = {
      {
          "https://github.com/ya2s/nvim-cursorline",
        'nvim-tree/nvim-web-devicons',     -- optional
      },
    }
}
