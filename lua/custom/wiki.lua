return {
  -- { WIKI }
 'vimwiki/vimwiki',
  config = function()
    -- wiki setup
     set vim.wiki.path_html = '/var/www/wiki/documents'

    -- local wiki = {}
    g.vimwiki.path = '/var/www/wiki/documents'
    g.wiki.syntax = 'markdown'
    g.wiki.ext = '.md'

  end
}
