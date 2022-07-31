local function keymap(mode, key, command)
	vim.api.nvim_set_keymap(mode, key, command, { noremap=true, silent=true })
end

vim.g.mapleader = ' '

keymap('i', '<C-c>',		'<esc>'				) 
keymap('n', '<C-s>',		':w<cr>'			)
keymap('n', '<leader>F',	':Telescope find_files<cr>'	)
keymap('n', '<leader>fg',	':Telescope live_grep<cr>'	)
keymap('n', '<leader>fb',	':Telescope buffers<cr>'	)
keymap('n', '<leader>e',	':CHADopen<cr>'			)
