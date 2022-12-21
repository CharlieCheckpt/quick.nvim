-- taken from https://github.com/jdhao/nvim-config/blob/master/lua/config/fugitive.lua
local keymap = vim.keymap

keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "[G]it [s]tatus" })
keymap.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "[G]it add" })
keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "[G]it [c]ommit" })
keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "[Git diff" })
keymap.set("n", "<leader>gl", "<cmd>Git pull<cr>", { desc = "[G]it pu[l]l" })
keymap.set("n", "<leader>gp", "<cmd>15 split|term git push<cr>", { desc = "[G]it [p]ush" })
