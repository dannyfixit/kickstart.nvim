
-- [[ Basic Keymaps ]] ----------------------------------------------

-- vim.keymap.set('c', 'w!!', "<esc>:lua require'utils'.sudo_write()<CR>", { silent = true })

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('v', 'J :m', '>+1<CR>gv=gv', {noremap=true}) -- move selected in visual mode
vim.keymap.set('v', 'K :m', '<-2<CR>gv=gv', {noremap=true}) -- move selected in visual mode

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })



-- vmap <C-y> ygv
vim.keymap.set('v', '<C-y>', 'ygv')

vim.keymap.set('n', '<leader>jj', ':%!jq .<CR>')


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


vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", {noremap=true})

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', 'DapContinue<CR>', {noremap=true})
vim.keymap.set('n', '<F1>', 'DapStepInto<CR>', {noremap=true})
vim.keymap.set('n', '<F2>', 'DapStepOver', {noremap=true})
vim.keymap.set('n', '<F3>', 'DapStepOut', {noremap=true})




-- vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():append() end)
-- vim.keymap.set("n", "<leader>A", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- vim.keymap.set("n", "<C-1>", function() require('harpoon'):list():select(1) end)
-- vim.keymap.set("n", "<C-1>", function() require('harpoon'):list():select(2) end)
-- vim.keymap.set("n", "<C-3>", function() require('harpoon'):list():select(3) end)
-- vim.keymap.set("n", "<C-4>", function() require('harpoon'):list():select(4) end)

-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C>=", function() require('harpoon'):list():prev() end)
-- vim.keymap.set("n", "<C>-", function() require('harpoon'):list():next() end)



