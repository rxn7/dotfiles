local function keymap(mode, key, command)
	vim.api.nvim_set_keymap(mode, key, command, { noremap=true, silent=true })
end

vim.g.mapleader = ' '

keymap('i', '<C-c>', '<esc>')
keymap('n', '<C-s>', ':w<cr>')
keymap('n', '<C-p>', ':Telescope find_files<cr>')
keymap('n', '<leader>fg', ':Telescope live_grep<cr>')
keymap('n', '<leader>fb', ':Telescope buffers<cr>')
keymap('n', '<leader>e', ':NvimTreeToggle<cr>')
keymap('n', '<M-j>', ':m .+1<CR>==')
keymap('n', '<M-k>', ':m .-2<CR>==')

keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>')
keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<cr>')
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>')
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>')
keymap('n', 'gr', ':lua vim.lsp.buf.references()<cr>')
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>')

keymap('v', '<', '<gv')
keymap('v', '>', '>gv')
