return {
    'vimwiki/vimwiki',
    config = function()
        --   vim.g.vimwiki_list = {{path = '/var/www/wiki/documents'}}
        --  -- vim.g.vimwiki_list = {{path_html = '/var/www/wiki/documents'}}
        --   vim.g.vimwiki_ext = '.md'
        --   vim.g.vimwiki_global_ext = 0

        --     local wiki = {}
        --     wiki.path = '/var/www/wiki/documents'
        --     wiki.syntax = 'markdown'
        --     wiki.ext = '.md'
        --     vim.g.vimwiki_list = {wiki}
        --
        -- ------------------------------------------------------
        --
        -- local wiki = {}
        -- wiki.path_html = '/var/www/wiki/documents'
        -- wiki.syntax = 'markdown'
        -- wiki.ext = '.md'
        -- vim.g.vimwiki_list = {wiki}
        -- vim.g.vim

        -- let vim.g.vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
        -- local wiki_1 = {}
        --       wiki_1.path = '/var/www/wiki1'
        --       wiki_1.syntax = 'markdown'
        --       wiki_1.ext = '.md'
        --       wiki_1.path_html = '/var/www/wiki/documents'

        --  vim.g.vimwiki_list = {wiki_1}


        -- vim.g.vimwiki_list = {{path = '/var/www/wiki/documents'}}
        -- vim.g.vimwiki_ext = '.md'
        -- vim.g.vimwiki_global_ext = 0

        -- local wiki = {}
        --  wiki.path = '/var/www/wiki/documents'
        --  wiki.syntax = 'markdown'
        --  wiki.ext = '.md'
        --  vim.g.vimwiki_list = {wiki}
        --
        -- -- -----------------------------------------------------
        -- wiki setup
        --vim.g.vimwiki_list = {
        --    {
        --        -- WikiLocal
        --        path_html = '/var/www/wiki/documents',
        --        path = '/var/www/wiki/documents',
        --        syntax    = 'markdown',
        --        ext       = '.md',
        --    }
        --}
    end
}
