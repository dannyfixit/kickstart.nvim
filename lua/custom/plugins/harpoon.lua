return {
    'ThePrimeagen/harpoon',
    dependencies = {
    	'nvim-lua/plenary.nvim'
    }, -- lua lib of useful funciton 
    --config = function()
    build = function()

        local map  = vim.api.nvim_set_keymap
        local mark = require("harpoon.mark")
        local ui   = require("harpoon.ui")

       -- vim.keymap.set('n', '<leader><leader>1',  ui.toggle_quick_menu, { desc = '[<leader>hl] Harpoon list' })
        vim.keymap.set("n", "<leader>ha", mark.add_file, {silent = true, noremap = true})
        vim.keymap.set("n", "<leader>hr", mark.rm_file, {silent = true, noremap = true})
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {silent = true, noremap = true})


    end
}
