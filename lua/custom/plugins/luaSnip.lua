return {
   'L3MON4D3/LuaSnip',
   dependencies = {
    'rafamadriz/friendly-snippets'
    },
    build = "make install_jsregexp",
    config = function()
      --
      -- [[ Configure nvim-cmp ]]
      -- See `:help cmp`
      local luasnip = require('luasnip')

      local cmp     = require('cmp')
      luasnip.config.setup {}

      require('luasnip.loaders.from_vscode').lazy_load()

    end,
}
