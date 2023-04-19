return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
     'nvim-tree/nvim-web-devicons', -- optional, for file icon,
  },
  opts = {


  },
  tag = 'nightly', -- optional, updated every week. (see issue #1193)
  config = function()



    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- empty setup using defaults
    -- require("nvim-tree").setup()

    -- OR setup with some options
    require("nvim-tree").setup({
       renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      sort_by = "case_sensitive",
      view = {
      width = 30,
     mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
})
  end;


}
