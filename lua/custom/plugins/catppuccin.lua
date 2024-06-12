return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    vim.cmd.colorscheme 'catppuccin'       -- vim.cmd.colorscheme 'onedark'
    vim.cmd([[colorscheme catppuccin]])
    require("catppuccin").setup({
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    })
  end,
}
