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

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>ss', ':setlocal spell spelllang=en_gb<CR>')