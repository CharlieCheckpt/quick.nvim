local keymap = vim.keymap
local telescope = require("telescope")
local actions = require "telescope.actions"

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      previewer = false,
    }
  },
}

require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<space>fb', ":Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-F>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-B>', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })


local builtin = require('telescope.builtin')
keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles" })  -- Lists files in your current working directory, respects .gitignore
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "[F]ind by [G]rep" })  -- Search for a string in your current working directory and get results live as you type, respects .gitignore
keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "[F]ind word" })  -- Searches for the string under your cursor in your current working directory
keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffers" })  -- Lists open buffers in current neovim instance
keymap.set('n', '<leader>ft', builtin.help_tags, { desc = "[F]ind [T]ags" })
keymap.set('n', '<leader>fr', builtin.registers, { desc = "[F]ind [R]egisters" })  -- Lists vim registers, pastes the contents of the register on <cr>

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- telescope git commands
-- vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { noremap = true }) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- vim.api.nvim_set_keymap("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { noremap = true }) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { noremap = true }) -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { noremap = true }) -- list current changes per file with diff preview ["gs" for git status]

