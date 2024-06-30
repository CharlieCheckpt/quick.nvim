vim.g.mapleader = " "
vim.o.number  = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
-- vim.o.tabstop = 2
vim.o.tabstop = 2 -- Make tabs equals to 4 columns
vim.o.softtabstop = 4 -- Make tabs equals to 4 columns
vim.o.shiftwidth = 2 -- Make a indentation equals to 2 columns
vim.o.shiftround = true -- Indentation to the closest tab
vim.o.expandtab = true -- Convert tab to spaces
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 10  -- how window move when you move vertically
vim.o.sidescrolloff = 10  -- how window move when you move horizontally
vim.o.errorbells = false
-- vim.o.shiftwidth = 2
vim.o.numberwidth = 4
vim.o.termguicolors = true
-- vim.o.colorcolumn = false
vim.o.showmode = false
-- vim.o.showtabline = 2
vim.o.showtabline = 1  -- never show the tabline
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'
vim.o.laststatus = 0  -- remove status line
vim.o.autoindent = false
vim.o.smartindent = false
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 200
vim.o.clipboard = "unnamed,unnamedplus"  -- Copy-paste between vim and everything else
vim.g.pyindent_open_paren = 0
vim.g.pyindent_close_paren = 0
-- vim.opt.shell = "/bin/bash"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.api.nvim_exec('language en_US', true)  -- set language to english

-- Highlight on Yank 
-- taken from https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set the winbar with file full path and git branch
vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = function()
        -- skip if a pop up window
        if vim.fn.win_gettype() == 'popup' then
            return
        end

        -- skip if new buffer
        if vim.bo.filetype == '' then
            return
        end

        -- set winbar: file path and git branch
        vim.wo.winbar = "%{%v:lua.require'config.winbar'.statusline()%}- [%{fugitive#Head()}]"
    end,
})

-- show cursor line only in active window. taken from https://github.com/folke/dot/blob/master/config/nvim/lua/config/commands.lua
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})


-- go to last loc when opening a buffer, taken from https://github.com/folke/dot/blob/master/config/nvim/lua/config/commands.lua
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*",
  callback = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "<buffer>",
      once = true,
      callback = function()
        vim.cmd(
          [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
        )
      end,
    })
  end,
})

-- configure wilder to use fuzzy searching
local wilder = require("wilder")
wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      -- sets the language to use, 'vim' and 'python' are supported
      language = 'python',
      -- 0 turns off fuzzy matching
      -- 1 turns on fuzzy matching
      -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
      fuzzy = 1,
    }),
    wilder.python_search_pipeline({
      -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
      pattern = wilder.python_fuzzy_pattern(),
      -- omit to get results in the order they appear in the buffer
      sorter = wilder.python_difflib_sorter(),
      -- can be set to 're2' for performance, requires pyre2 to be installed
      -- see :h wilder#python_search() for more details
      engine = 're',
    })
  ),
})

-- make indent work properly
require("nvim-treesitter.configs").setup {
  yati = {
    enable = true,
    -- Disable by languages, see `Supported languages`
    disable = { "python" },

    -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
    default_lazy = true,

    -- Determine the fallback method used when we cannot calculate indent by tree-sitter
    --   "auto": fallback to vim auto indend
    --   "asis": use current indent as-is
    --   "cindent": see `:h cindent()`
    -- Or a custom function redurn the final indent result.
    default_fallback = "auto"
  },
  indent = {
    enable = true, -- disable builtin indent module
    disable = { "python" }
  }
}

-- docstring
-- vim.g.pydocstring_doq_path =  "/mnt/disks/sdb/usr_data/DATA_CSAILLARD/envs/venv/bin/doq"
-- vim.g.pydocstring_formatter = "google"

require'treesitter-context'.setup{
  multiline_threshold = 1, -- Maximum number of lines to show for a single context
}

require("ibl").setup{ 
    -- indent = { highlight = 'Comment' },
    scope = {
        show_start = false,
        show_end = false,
    },
}

require("zen-mode").setup {
  window = {
    width = 200,
  }
}

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})

vim.g.python3_host_prog = "/Users/csaillard/.pyenv/versions/default_venv/bin/python"

require("tint").setup()
