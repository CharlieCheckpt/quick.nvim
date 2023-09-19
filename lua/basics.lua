vim.g.mapleader = " "
vim.o.number  = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
-- vim.o.tabstop = 2
vim.o.tabstop = 4 -- Make tabs equals to 4 columns
vim.o.softtabstop = 4 -- Make tabs equals to 4 columns
vim.o.shiftwidth = 4 -- Make a indentation equals to 4 columns
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
vim.o.sidescrolloff = 50  -- how window move when you move horizontally
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
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 200
vim.o.clipboard = "unnamed,unnamedplus"  -- Copy-paste between vim and everything else

-- disable space
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vertical split
vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })

-- horizontal split (s is already taken by leap)
vim.api.nvim_set_keymap('n', 'hs', ':sp<CR>', { noremap = true })

-- move between windows
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })

-- open terminal
vim.api.nvim_set_keymap("n", "<leader>te", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})

-- ??
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })

-- easier saving
vim.api.nvim_set_keymap("i", "<C-w>", "<cmd>:w!<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>w", ":w!<cr>", {noremap = true, silent = true})

-- Replace current selection with what is in the registry
vim.api.nvim_set_keymap("v", "<leader>p", '"_dP', { noremap = true })

-- from the primeagen video : go up/down and center to not be distracted
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true }) --  go to previous tab
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true }) --  go to previous tab

-- Quit all opened buffers
vim.api.nvim_set_keymap("n", "<leader>qq", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

-- Keep visual mode indenting
vim.keymap.set("v", "<", "<gv", silent)
vim.keymap.set("v", ">", ">gv", silent)

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't yank on delete char
vim.keymap.set("n", "x", '"_x', silent)
vim.keymap.set("n", "X", '"_X', silent)
vim.keymap.set("v", "x", '"_x', silent)
vim.keymap.set("v", "X", '"_X', silent)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>" )
vim.keymap.set("n", "<Down>", ":resize +2<CR>" )
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>" )
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>" )
vim.keymap.set("n", "<S-Right>", ":vertical resize -60<CR>" )
vim.keymap.set("n", "<S-Left>", ":vertical resize +60<CR>" )

-- windows management
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- leap keymaps
require('leap').set_default_keymaps()

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

-- Set the winbar with file full path
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

        vim.wo.winbar = "%{%v:lua.require'config.winbar'.statusline()%}"
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
    enable = false -- disable builtin indent module
  }
}

-- docstring
vim.g.pydocstring_doq_path =  "/mnt/disks/sdb/usr_data/DATA_CSAILLARD/envs/venv/bin/doq"
vim.g.pydocstring_formatter = "google"
vim.api.nvim_set_keymap('n', '<leader>dc', ':Pydocstring<CR>', { noremap = true })


--Multi cursor
-- let g:VM_maps = {}
-- let g:VM_maps["Add Cursor Down"]    = '<M-j>'   " new cursor down
-- let g:VM_maps["Add Cursor Up"]      = '<M-k>'   " new cursor up
--
-- vim.api.nvim_set_keymap('n', '<C-n>', ":vm-find-word<CR>", { noremap = true })

-- structural search
vim.keymap.set({ "n", "x" }, "<leader>z", function() require("ssr").open() end)


require'treesitter-context'.setup{
  multiline_threshold = 1, -- Maximum number of lines to show for a single context
}

require('telepath').use_default_mappings()
