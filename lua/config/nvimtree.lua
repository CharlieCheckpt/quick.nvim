-- nvim-tree setup

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
vim.api.nvim_set_keymap('n', '<C-N>', ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', ":NvimTreeFindFile<CR>", { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-N>', ":NvimTreeClose<CR>", { noremap = true })

require'nvim-treesitter.configs'.setup {
  ensure_installed = "python",
  ignore_install = { "phpdoc" },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { "lua" }
  },
  indent = {
    enable = true
  },
  incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        scope_incremental = '<CR>',
        node_incremental = '<TAB>',
        node_decremental = '<S-TAB>',
    },
  }
}
