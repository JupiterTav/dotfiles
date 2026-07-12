vim.cmd([[ set termguicolors]])
vim.cmd([[ set number ]])
vim.cmd([[ set inccommand=split ]])
vim.cmd([[ set encoding=utf8 ]])
vim.cmd([[ set mouse= ]])
vim.cmd([[ set confirm ]])
vim.cmd([[ set title ]])
vim.cmd([[ set t_Co=256 ]])
vim.cmd([[ set expandtab]])
vim.cmd([[ set tabstop=4 ]])
vim.cmd([[ set shiftwidth=4 ]])
vim.cmd([[ set softtabstop=4 ]])
vim.cmd([[ set softtabstop=4 ]])
vim.cmd([[ set guicursor= ]])
vim.opt.relativenumber = true
vim.opt.confirm = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.o.winborder = "rounded"
vim.cmd([[ syntax on]])
vim.o.background = "dark"
vim.cmd([[ colorscheme kanso-zen]])
vim.filetype.add({
  extension = {
    hlsl = "hlsl",
  }
})
