local ranger = require("ranger-nvim")
ranger.setup({
	replace_netrw = false,
})

local function open_ranger()
	ranger.open()
end

vim.keymap.set('n', '<leader>e', open_ranger)
