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

require("lazy").setup({
    "lewis6991/impatient.nvim",
    "folke/which-key.nvim",
    {"neoclide/coc.nvim", branch = "release"},
    "sainnhe/sonokai",
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    { "yioneko/nvim-yati", tag = "*", requires = "nvim-treesitter/nvim-treesitter" },
    'tpope/vim-commentary',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'lukas-reineke/indent-blankline.nvim',
    {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
    },
    "nvim-telescope/telescope-file-browser.nvim",
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    "ur4ltz/surround.nvim",
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
    { 'nvim-tree/nvim-tree.lua', tag = 'nightly' },
    -- command line completion 
    'gelguy/wilder.nvim',
    -- git integration
    'tpope/vim-fugitive',
    'rareitems/printer.nvim',
})

