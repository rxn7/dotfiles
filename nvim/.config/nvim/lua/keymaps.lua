local function keymap(mode, key, command)
	vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = true })
end

vim.g.mapleader = ' '

keymap('n', 'Y', 'y$')
keymap('n', '<C-s>', ':w<cr>')

keymap('n', '<leader>e', ':NvimTreeToggle<cr>')

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<cr>')
keymap('n', '<leader>fg', ':Telescope live_grep<cr>')
keymap('n', '<leader>fd', ':Telescope diagnostics<cr><esc>')
keymap('n', '<leader>fb', ':Telescope buffers<cr><esc>')
keymap('n', '<leader>fs', ':Telescope lsp_dynamic_workspace_symbols<cr>')

-- Move selection
keymap('x', '<S-j>', 'xp`[V`]')
keymap('x', '<S-h>', '<gv')
keymap('x', '<S-l>', '>gv')
keymap('x', '<S-k>', 'xkP`[V`]')

-- LSP
keymap('n', 'gr', ':lua vim.lsp.buf.references()<cr>')
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>')
keymap('n', 'grn', ':lua vim.lsp.buf.rename()<cr>')
keymap('n', '<C-k>', ':lua vim.lsp.buf.hover()<cr>')
keymap('n', 'K', ':lua vim.lsp.buf.signature_help()<cr>')
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>')
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>')
keymap('n', 'gf', ':lua vim.lsp.buf.format()<cr>')
