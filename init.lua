require('basics')
require('colors')
-- require('config/telescope')
-- require('config/fugitive')
-- require('config/coc')
-- require('config/treesitter')
-- require('config/better_escape')
require('config/lsp')


return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- use {'neoclide/coc.nvim', branch = 'release'}

    use 'sainnhe/sonokai'
    
    -- LSP with lsp-zero for ease
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-path'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

end)
