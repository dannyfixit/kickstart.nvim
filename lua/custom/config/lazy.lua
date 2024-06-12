local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp = vim.opt.rtp ^ lazypath


local lazyopts = {
  install = {
    colorscheme = { "gruvbox" }, -- try to load colorschemes when starting an installation during startup
  },
  change_detection = { notify = false,}

}



require('lazy').setup({

  { import = "custom/plugins"}
},
lazyopts)

