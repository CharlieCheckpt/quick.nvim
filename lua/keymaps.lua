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

vim.api.nvim_set_keymap('n', '<leader>dc', ':Pydocstring<CR>', { noremap = true })

-- structural search
-- vim.keymap.set({ "n", "x" }, "<leader>z", function() require("ssr").open() end)

require('telepath').use_default_mappings()

-- harpoon keymaps
vim.keymap.set({ "n" }, "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
vim.keymap.set({ "n" }, "<leader>x", ":lua require('harpoon.mark').rm_file()<CR>", { noremap = true })
vim.keymap.set({ "n" }, "<leader>o", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
vim.keymap.set({ "n" }, "<leader>&", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true })
vim.keymap.set({ "n" }, "<leader>é", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true })
vim.keymap.set({ "n" }, "<leader>\"", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true })

-- nvim-tree keymaps
vim.api.nvim_set_keymap('n', '<C-x>', ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e', ":NvimTreeFindFile<CR>", { noremap = true })

vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { noremap = true })

-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>m", "<cmd>AerialToggle!<CR>", { noremap = true })

