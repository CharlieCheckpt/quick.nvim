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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- faster neovim startup : it is recommended to put impatient.nvim before any other plugins
    'lewis6991/impatient.nvim',
    {'neoclide/coc.nvim', branch = 'release'},

    -- color themes
    'Yazeed1s/minimal.nvim',
    'folke/tokyonight.nvim',
    'sainnhe/sonokai',
    "loctvl842/monokai-pro.nvim",
    { "catppuccin/nvim", as = "catppuccin" },

    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',

    'tpope/vim-commentary',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'lukas-reineke/indent-blankline.nvim',
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    { "nvim-telescope/telescope-file-browser.nvim" },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    
    {"ur4ltz/surround.nvim"},
    {
      "max397574/better-escape.nvim",
      config = function()
        require("better_escape").setup()
      end,
    },
    -- easy motion with s
    'ggandor/leap.nvim',

    'DanilaMihailov/beacon.nvim',
    -- file explorer
    {
      'nvim-tree/nvim-tree.lua',
      -- requires = {
      --   'nvim-tree/nvim-web-devicons', -- optional, for file icons
      -- },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    -- command line completion 
    'gelguy/wilder.nvim',
    -- git integration
    'tpope/vim-fugitive',
    'rareitems/printer.nvim',
}

require("lazy").setup(plugins, opts)
