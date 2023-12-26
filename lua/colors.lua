-- tokyonight
-- vim.g.tokyonight_style = 'moon'
-- vim.cmd([[colorscheme tokyonight]])

-- oh-lucy
-- vim.o.background = 'dark'
-- vim.cmd([[colorscheme oh-lucy]])

-- sonokai
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_transparent_background = 1

-- vim.g.sonokai_spell_foreground = "colored"
-- vim.g.sonokai_enable_italic = 1
-- vim.cmd([[colorscheme sonokai]])

-- embark
-- vim.cmd([[colorscheme embark]])

--oxocarbon
-- vim.cmd([[colorscheme oxocarbon-lua]])

-- monokai-pro
-- require("monokai-pro").setup({
--   filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
-- 	transparent_background = false, -- better set to false
-- 	italic_comments = true,
-- 	diagnostic = {
-- 		background = true, -- highlight background of diagnostic
-- 	},
--     plugins = {
--         bufferline = {
--             underline_selected = true, -- better set `false` if you don't use kitty terminal
--         }
--     }
-- })
require("monokai-pro").setup({ 
    filter = "octagon", 
    italic_comments = true, 
    diagnostic = { background = true },
    plugins = {
        bufferline = { underline_selected = false },
        indent_blankline = {
            context_highlight = "default", -- default | pro
            context_start_underline = true,
        },
    }
})
vim.cmd([[colorscheme monokai-pro]])
