return {
  -- { WIKI }
 'vimwiki/vimwiki',
  config = function()
    -- wiki setup
    vim.wiki.path_html = '/var/www/wiki/documents'

    -- local wiki = {}
    vim.g.vimwiki.path = '/var/www/wiki/documents'
    vim.g.wiki.syntax = 'markdown'
    vim.g.wiki.ext = '.md'

  end
}
