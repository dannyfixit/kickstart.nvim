return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd.colorscheme 'gruvbox'       -- vim.cmd.colorscheme 'onedark'
    vim.o.transparent_mode = true
    vim.cmd([[colorscheme gruvbox]])
  end,
}


