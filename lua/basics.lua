vim.g.mapleader = " "
vim.o.number  = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 2
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 50
vim.o.errorbells = false
vim.o.shiftwidth = 2
vim.o.numberwidth = 4
vim.o.termguicolors = true
vim.o.colorcolumn = '100'
vim.o.showmode = false
-- vim.o.showtabline = 2
vim.o.showtabline = 0  -- never show the tabline
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'
vim.o.laststatus = 0  -- remove status line
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.clipboard = "unnamed,unnamedplus"  -- Copy-paste between vim and everything else


vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'sp', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>te", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":w!<cr>", {noremap = true, silent = true})
-- Replace current selection with what is in the registry
vim.api.nvim_set_keymap("v", "<leader>p", '"_dp', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>y", "'+y", { noremap = true })
-- vim.api.nvim_set_keymap("v", "<leader>y", "'+y", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>Y", "'+Y", { noremap = true })

-- from the primeagen video : go up/down and center to not be distracted
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true }) --  go to previous tab
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true }) --  go to previous tab

-- Quit all opened buffers
vim.api.nvim_set_keymap("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

-- Keep visual mode indenting
vim.keymap.set("v", "<", "<gv", silent)
vim.keymap.set("v", ">", ">gv", silent)

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

-- set the winbar
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

-- CHARLIE: win bar with full file path ? not working right now ...
-- vim.o.winbar = "%{%v:lua.require'nvim.lua.config.winbar'.eval()%}"
