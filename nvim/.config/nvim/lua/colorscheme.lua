vim.o.termguicolors = true
vim.cmd('colorscheme blue-moon')

vim.api.nvim_set_hl(0, "Normal", {ctermbg="none", bg="none"})
vim.api.nvim_set_hl(0, "NonText", {ctermbg="none", bg="none"})
vim.api.nvim_set_hl(0, "Text", {ctermbg="none", bg="none"})
vim.api.nvim_set_hl(0, "CursorLine", {ctermbg=221, bg='#282c34'})
vim.api.nvim_set_hl(0, "EndOfBuffer", {ctermbg="none", bg="none"})
