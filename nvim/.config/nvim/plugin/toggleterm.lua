local status, toggleterm = pcall(require, 'toggleterm')
if not status then return end

toggleterm.setup({
	size = 20,
	open_mapping = "<C-t>",
	hide_numbers = true,
	start_in_insert = true,
	insert_mappings = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	auto_scroll = true,
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
