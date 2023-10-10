-- edit init.lua
vim.keymap.set('n', '<Leader>ei', ":tabnew ~/.config/nvim/init.lua<cr>") -- edit init.lua file in new tab
-- center page 
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', 'n', 'nzz')
-- splits
vim.keymap.set('n', '<Leader>hh', ':vsp<cr>')
vim.keymap.set('n', '<Leader>vv', ':sp<cr>')
-- move between splits
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- nvim0tree
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>')

vim.keymap.set('n', '<C-b>', '<C-b>zz<CR>')
vim.keymap.set('n', '<C-f>', '<C-f>zz<CR>')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', '{', '{zz')

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>ss', ':setlocal spell spelllang=en_gb<CR>')


-- require('nvim-tmux-navigation')
-- vim.g.tmux_navigator_no_mappings = 1

vim.keymap.set('n',  "<A-h>", ":NvimTmuxNavigateLeft<CR>")
vim.keymap.set('n', "<A-j>", ":NvimTmuxNavigateDown<CR>")
vim.keymap.set('n', "<A-k>", ":NvimTmuxNavigateUp<CR>")
vim.keymap.set('n', "<A-l>", ":NvimTmuxNavigateRight<CR>")
vim.keymap.set('n', "<A-\\>", ":NvimTmuxNavigateLastActive<CR>")
vim.keymap.set('n', "<A-Space>", ":NvimTmuxNavigateNext<CR>")

vim.keymap.set('n', "<C-p>", ":Telescope projects<CR>")

vim.keymap.set('n', "<Leader>ff", ":Telescope find_files<CR>")
vim.keymap.set('n', "<Leader>fu", ":Telescope buffers<CR>")

vim.keymap.set('n', "<Leader>pp", ":TagbarToggle<CR>")
vim.keymap.set('n', "<Leader>go", ":vs | te python %<CR>")

