local map = vim.api.nvim_set_keymap
-- TABLINE: BARBAR
local tab_opts = { noremap = true, silent = true}

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', tab_opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', tab_opts)

map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', tab_opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', tab_opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', tab_opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', tab_opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', tab_opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', tab_opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', tab_opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', tab_opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', tab_opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', tab_opts)
