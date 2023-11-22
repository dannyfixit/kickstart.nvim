-- a = add new file
-- f = rename file
-- d = deleat
-- c = copy
-- c = cut
-- p - past
-- y - copy filenane
-- Y - copy relative filenane
-- H - toggle dot filters
-- R - refresh list
-- - - dir updated
-- s - open file with system
-- f - find file
-- Ctr + k - info
-- g + ? - help
-- q quit exploring


return {

    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- dependencies = { 'custom.plugins.devicons' },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.g.update_cwd          = false



        vim.g.nvim_tree_respect_buf_cwd = 1
        vim.g.sync_root_with_cwd = 1
        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true
        -- empty setup using defaults
        -- require("nvim-tree").setup()
--        require("nvim-tree/nvim-web-devicons")
        -- OR setup with some options
        require("nvim-tree").setup({
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            -- filesystem = {
            --     filters = {
            --         respect_gitignore = true,
            --         gitignore_treatmente = 'symbol' -- can be 'hidden' or 'symbol'
            --     }
            -- },
            sort_by = "case_sensitive",
            view = {
                side = "right",
                width = 40,
                mappings = {
                    list = {
                        { key = "u", action = "dir_up" },
                    },
                },
            },
        })
    end,
}
