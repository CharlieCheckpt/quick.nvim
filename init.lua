require('basics')
require('colors')
require('telescope-config')
require('coc-config')

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { "lua" }
  },
  indent = {
    enable = true
  }
}

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'folke/tokyonight.nvim'
  use 'nvim-treesitter/nvim-treesitter' 
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }
  use({
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps()
    end
  }) 
  use 'DanilaMihailov/beacon.nvim'
  use 'lewis6991/impatient.nvim'
--  use 'justinmk/vim-sneak'
end)
