-- Fuzzy Finder (files, lsp, etc)
return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup()`
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
        }
        -- require('telescope').load_extension('projects')
        -- require("telescope").load_extension("live_grep_args")



        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')

        -- See `:help telescope.builtin`

        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find old files' })
     --   vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find buffers' })
        vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
            { desc = '[/] Fuzzily search in current buffer' })
        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').grep_string, { desc = '[S]earch [G]rep' })
        vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch [G]rep' })
        -- vim.keymap.set("n", "<leader>fg", require('telescope').extensions.live_grep_args.live_grep_args())

        -- vim.keymap.set("n", "<leader>p", require("telescope").extensions.live_grep_args.live_grep_args())

        -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
        --  vim.keymap.set("n", "<leader>f", require('telescope.extensions').live_grep_args.live_grep_args())
	-- Enable telescope fzf native, if installed
	pcall(require('telescope').load_extension, 'fzf')


    end
}
