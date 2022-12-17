require('basics')
require('colors')
require('config/telescope')
require('config/fugitive')
require('config/coc')
require('config/treesitter')
require('config/better_escape')
-- require('config/winbar')


-- command line completion
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

-- -- Automatically source and re-compile packer whenever you save this init.lua
-- -- From https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'source <afile> | PackerCompile',
--   group = packer_group,
--   pattern = vim.fn.expand '$MYVIMRC',
-- })

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- faster neovim startup : it is recommended to put impatient.nvim before any other plugins
  use 'lewis6991/impatient.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  -- use 'folke/tokyonight.nvim'
  -- use 'Yazeed1s/oh-lucy.nvim'
  use 'sainnhe/sonokai'
  use { 'embark-theme/vim', as = 'embark' }
  -- use 'B4mbus/oxocarbon-lua.nvim'
  use 'nvim-treesitter/nvim-treesitter' 
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  
  use {"ur4ltz/surround.nvim"}
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }
  -- easy motion with s
  use({
    'ggandor/leap.nvim',
  }) 
  use 'DanilaMihailov/beacon.nvim'
  -- file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    -- requires = {
    --   'nvim-tree/nvim-web-devicons', -- optional, for file icons
    -- },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- command line completion 
  use {
    'gelguy/wilder.nvim',
  }
  -- git integration
  use { "tpope/vim-fugitive", config = [[require('lua.config.fugitive')]] }
end)

