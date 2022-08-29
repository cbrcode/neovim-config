local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>ft', ':Lexplore<CR>')
map('n', '<leader>ca', ':bufdo bd<CR>')
map('n', '<F5>', ':UndotreeToggle<CR>')
map('n', '<leader>tr', ':TroubleToggle<CR>')
