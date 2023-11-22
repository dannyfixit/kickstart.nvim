 -- Autocompletion
return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'',
    },
    lazy = false,
    on_attach = function(cmp)


	-- [[ Configure nvim-cmp ]]
	-- See `:help cmp`
	local luasnip = require('luasnip')
	require('luasnip.loaders.from_vscode').lazy_load()
	luasnip.config.setup {}

	cmp.setup {
	  snippet = {
	    expand = function(args)
	      luasnip.lsp_expand(args.body)
	    end,
	  },
	  mapping = cmp.mapping.preset.insert {
	    ['<C-n>'] = cmp.mapping.select_next_item(),
	    ['<C-p>'] = cmp.mapping.select_prev_item(),
	    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	    ['<C-f>'] = cmp.mapping.scroll_docs(4),
	    ['<C-Space>'] = cmp.mapping.complete {},
	    ['<CR>'] = cmp.mapping.confirm {
	      behavior = cmp.ConfirmBehavior.Replace,
	      select = true,
	    },
	    ['<Tab>'] = cmp.mapping(function(fallback)
	      if cmp.visible() then
		cmp.select_next_item()
	      elseif luasnip.expand_or_locally_jumpable() then
		luasnip.expand_or_jump()
	      else
		fallback()
	      end
	    end, { 'i', 's' }),
	    ['<S-Tab>'] = cmp.mapping(function(fallback)
	      if cmp.visible() then
		cmp.select_prev_item()
	      elseif luasnip.locally_jumpable(-1) then
		luasnip.jump(-1)
	      else
		fallback()
	      end
	    end, { 'i', 's' }),
	  },
	  sources = {
	    { name = 'nvim_lsp' },
	    { name = 'luasnip' },
	  },

























	    -- Set up lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
 --    capabilities = capabilities
 --  }
	}



     end,
     config = function()



--local capabilities = require('cmp_nvim_lsp').default_capabilities()

--require'lspconfig'.lua_ls.setup {
--    capabilities = capabilities,
--    on_attach = function()
--       vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {buffer = 0})
--       vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
--       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
--       vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer = 0})
--       vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
--       vim.keymap.set('n', '<leader>gf', vim.diagnostic.goto_next, {buffer = 0})
--       vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, {buffer = 0})
--       vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = 0})
--       vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0, desc = 'LSP: [C]ode [A]ction' })

--       --  nmap('<leader>wl', function()
--       --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       --  end, '[W]orkspace [L]ist Folders')
--       --  -- Create a command `:Format` local to the LSP buffer
--	--  vim.api.nvim_buf_create_user_command(0, 'Format', function(_)
--	--    vim.lsp.buf.format()
--	--  end, { desc = 'Format current buffer with LSP' })
--	--end


--    end,
--    settings = {
--        lua_ls = {
--	    Lua = {
--	        workspace = { checkThirdParty = false },
--		    telemetry = { enable = false },
--	 	    diagnostics = {
--		        undefined_global = false,   -- remove this from diag!
--		        missing_parameters = false, -- missing fields :)
--	  	        globals = {
--	                    'vim',
--    	                    'require'
--	                },
--	           },
--            },
--       },
--   }
--}



--require'lspconfig'.intelephense.setup {
--    capabilities = capabilities,
--    on_attach = function()
--       vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {buffer = 0})
--       vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
--       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
--       vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer = 0})
--       vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
--       vim.keymap.set('n', '<leader>gf', vim.diagnostic.goto_next, {buffer = 0})
--       vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, {buffer = 0})
--       vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = 0})
--       vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0, desc = 'LSP: [C]ode [A]ction' })

--       vim.keymap.set('n', '<leader>wl', function()
--	    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       end, { buffer = 0, desc = 'LSP: [W]orkspace [L]ist Folders'})
--       --	  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--       --	    vim.lsp.buf.format()
--       --	  end, { desc = 'Format current buffer with LSP' })
--       --  nmap('<leader>wl', function()
--       --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       --  end, '[W]orkspace [L]ist Folders')//
--    end,

--    settings = {

--      intelephense = {
--	 diagnostics = {
--		   undefinedProperties = false,
--	    -- undefinedTypes = false,
--	       },
--	       completionItem = {
--		  snippetSupport = true,
--		  resolveProvider = true,
--	       },
--	 environment = {
--	    includePaths = {
--	      "/home/peachy/Documents/cmd/better2know.net/application/core",
--	      "/home/peachy/Documents/cmd/better2know.net/application",
--	      "/home/peachy/Documents/cmd/better2know.net/system",
--	      "/home/peachy/Documents/cmd/better2know.net/system/core",
--	    },
--	 }
--      }
--    }
--}



--require'lspconfig'.pyright.setup {
--    capabilities = capabilities,
--    on_attach = function()
--       vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {buffer = 0}) -- think this dosent work
--       vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
--       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
--       vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer = 0})
--       vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
--       vim.keymap.set('n', '<leader>gf', vim.diagnostic.goto_next, {buffer = 0})
--       vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, {buffer = 0})
--       vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = 0})
--       vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0, desc = 'LSP: [C]ode [A]ction' })

--       -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--	--    vim.lsp.buf.format()
--	--  end, { desc = 'Format current buffer with LSP' })

--       --  nmap('<leader>wl', function()
--       --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       --  end, '[W]orkspace [L]ist Folders')
--    end,
--    -- settings = {
--    -- }
--}


     end










    -- config = function()

	  -- Set up lspconfig.
--	  local capabilities = require('cmp_nvim_lsp').default_capabilities()

	  -- Set up nvim-cmp.
  --        local cmp = require('cmp').ConfigSchema
  	  --  local cmp = require('cmp')


	  -- cmp.config {}
          -- cmp.ConfigSchema = {}

--	  local luasnip = require('luasnip')

  --        luasnip.setup {}

--	  vim.opt.completeopt = { "menu", "menuone", "noselect" }

	  -- cmp.setup({
	  --   snippet = {
	  --     expand = function(args)
		-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	  --     end,
	  --   },
	  --   window = {
	  --     -- completion = cmp.config.window.bordered(),
	  --     -- documentation = cmp.config.window.bordered(),
	  --   },
	  --   mapping = cmp.mapping.preset.insert({
	  --     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  --     ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  --     ['<C-Space>'] = cmp.mapping.complete(),
	  --     ['<C-e>'] = cmp.mapping.abort(),
	  --     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	  --   }),
	  --   sources = cmp.config.sources({
	  --     { name = 'nvim_lsp' },
	  --     { name = 'luasnip' }, -- For luasnip users.
	  --   }, {
	  --     { name = 'buffer' },
	  --   })
	  -- })

	  -- Set configuration for specific filetype.
	  -- cmp.setup.filetype('gitcommit', {
	  --   sources = cmp.config.sources({
	  --     { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	  --   }, {
	  --     { name = 'buffer' },
	  --   })
	  -- })

	  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	  -- cmp.setup.cmdline({ '/', '?' }, {
	  --   mapping = cmp.mapping.preset.cmdline(),
	  --   sources = {
	  --     { name = 'buffer' }
	  --   }
	  -- })

	  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	  -- cmp.setup.cmdline(':', {
	  --   mapping = cmp.mapping.preset.cmdline(),
	  --   sources = cmp.config.sources({
	  --     { name = 'path' }
	  --   }, {
	  --     { name = 'cmdline' }
	  --   })
	  -- })

	  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
	  --   capabilities = capabilities
	  -- }





   -- end,
}
