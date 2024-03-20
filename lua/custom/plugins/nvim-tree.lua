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
    -- tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.g.update_cwd = true



        vim.g.nvim_tree_respect_buf_cwd = 1
        vim.g.sync_root_with_cwd = 1
        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true
        -- empty setup using defaults
        -- require("nvim-tree").setup()
--        require("nvim-tree/nvim-web-devicons")
        -- OR setup with some options
        require("nvim-tree").setup({
            -- auto_close = true,
            update_focused_file = {
                enable = true,
                update_cwd = true,
                ignore_list = {}
            },
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
            actions = {
               file_popup = {
                  open_win_config = {
                    col = 1,
                    row = 1,
                    relative = "cursor",
                    border = "none",
                    style = "minimal",
                  },
                },
                open_file = {
                    quit_on_open = true,
                },
            },
            sort_by = "case_sensitive",
            view = {
                side = "right",
                width = 40,
                -- mappings = {
                --     list = {
                --         { key = "u", action = "dir_up" },
                --     },
                -- },
            },
        })


        -- nvim-tree is also there in modified buffers so this function filter it out
        local modifiedBufs = function(bufs)
            local t = 0
            for k,v in pairs(bufs) do
                if v.name:match("NvimTree_") == nil then
                    t = t + 1
                end
            end
            return t
        end

        vim.api.nvim_create_autocmd("BufEnter", {
            nested = true,
            callback = function()
                if #vim.api.nvim_list_wins() == 1 and
                vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
                modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
                    vim.cmd "quit"
                end
            end
        })
    end,
}
