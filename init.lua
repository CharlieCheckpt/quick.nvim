require('basics')
require('colors')
require('config/telescope')
require('config/fugitive')
require('config/coc')
require('config/treesitter')
require('config/better_escape')

-- command line completion
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- faster neovim startup : it is recommended to put impatient.nvim before any other plugins
  use 'lewis6991/impatient.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}

  -- color themes
  use 'Yazeed1s/minimal.nvim'
  use 'folke/tokyonight.nvim'
  use 'Yazeed1s/oh-lucy.nvim'
  use 'sainnhe/sonokai'
  use "EdenEast/nightfox.nvim" -- Packer
  use("loctvl842/monokai-pro.nvim")
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'embark-theme/vim', as = 'embark' }
  use 'B4mbus/oxocarbon-lua.nvim'
  use {
      'ramojus/mellifluous.nvim',
      requires = {'rktjmp/lush.nvim'}
  }

  use 'nvim-treesitter/nvim-treesitter' 
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use({ "yioneko/nvim-yati", tag = "*", requires = "nvim-treesitter/nvim-treesitter" })

  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  
  use {"ur4ltz/surround.nvim"}
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }
  -- easy motion with s
  use 'ggandor/leap.nvim'

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
  use 'tpope/vim-fugitive'

  use 'heavenshell/vim-pydocstring'
  -- For use of C-Up and C-Down on mac, you'll need to do this 
  -- https://github.com/mg979/vim-visual-multi/issues/146#issuecomment-1051939112
  use {'mg979/vim-visual-multi', branch = 'master'}
  use {'kaicataldo/material.vim', branch = 'main'}
  use {
    "cshuaimin/ssr.nvim",
    module = "ssr",
    -- Calling setup is optional.
    config = function()
        require("ssr").setup {
            border = "rounded",
            min_width = 50,
            min_height = 5,
            max_width = 120,
            max_height = 25,
            keymaps = {
                close = "q",
                next_match = "n",
                prev_match = "N",
                replace_confirm = "<cr>",
                replace_all = "<leader><cr>",
            },
        }
    end
  }
end)
