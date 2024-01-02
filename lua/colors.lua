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
-- Apply custom highlights on colorscheme change.
-- Must be declared before executing ':colorscheme'.
-- local grpid = vim.api.nvim_create_augroup('custom_highlights_sonokai', {})
-- vim.api.nvim_create_autocmd('ColorScheme', {
--   group = grpid,
--   pattern = 'sonokai',
--   callback = function()
--     local config = vim.fn['sonokai#get_configuration']()
--     local palette = vim.fn['sonokai#get_palette'](config.style, config.colors_override)
--     local set_hl = vim.fn['sonokai#highlight']

--     set_hl('Visual', palette.none, palette.grey_dim)
--     -- set_hl('IncSearch', palette.bg0, palette.yellow)
--     -- set_hl('Search', palette.none, palette.diff_yellow)
--   end
-- })

vim.cmd([[colorscheme sonokai]])

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
-- vim.cmd([[colorscheme monokai-pro]])
