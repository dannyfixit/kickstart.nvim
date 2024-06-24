-- https://github.com/goolord/alpha-nvim
-- Dashboard splashpage
return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require 'alpha'.setup(require 'custom.config.dashboard'.config)
    end
};
