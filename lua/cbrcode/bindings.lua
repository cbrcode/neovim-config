local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>fc', ':%bd<bar>q!<CR>')
map('n', '<F5>', ':UndotreeToggle<CR>')
map('n', '<leader>tr', ':TroubleToggle<CR>')
map('n', '<leader>er', ':NeoTreeFocusToggle<CR>')
map('n', '<leader>dx', ':Ex<CR>')
map('n', '<leader>nh', ':nohl<CR>')
map('n', '<leader>z', ':ZenMode<CR>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-L>', '<C-W><C-L>')

-- tabs
map('n', '<leader>tn', ':lua vim.cmd(":tabedit "..require("telescope.builtin").find_files())<CR>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
