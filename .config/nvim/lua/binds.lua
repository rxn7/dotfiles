local opts = {noremap=true, silent=true}
local map = vim.api.nvim_set_keymap

map('n','<C-s>',':w<cr>',opts)
map('n','<C-p>',':Files<cr>',opts)
map('n','<C-f>',':Lexplore<cr>',opts)
map('i','<C-c>','<esc>',opts)
