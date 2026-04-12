local map =vim.api.nvim_set_keymap
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

-- LSP
map('n', 'gl', '<Cmd>:lua vim.diagnostic.open_float()<CR>', tab_opts)
-- TELESCOPE
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {desc = 'Telescope find files'})
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })

-- LAZYGIT / TOGGLETERM 
local terminal = require("toggleterm.terminal").Terminal
local lazygit = terminal:new({cmd = "lazygit", hidden=true})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", '<leader><C-L>', '<Cmd>lua _lazygit_toggle()<CR>', tab_opts)
