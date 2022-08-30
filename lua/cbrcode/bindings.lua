local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>ca', ':%bd<bar>q!<CR>')
map('n', '<F5>', ':UndotreeToggle<CR>')
map('n', '<leader>tu', ':UndotreeFocus<CR>')
map('n', '<leader>tr', ':TroubleToggle<CR>')
map('n', '<leader>ft', ':NeoTreeFocus<CR>')
