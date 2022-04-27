local opts = {noremap=true, silent=true}
local map = vim.api.nvim_set_keymap

map('n','<C-s>',':w<cr>',opts)
map('n','<C-p>',':Telescope find_files<cr>',opts)
map('n','<C-f>',':NvimTreeToggle<cr>',opts)
map('i','<C-c>','<esc>',opts)
map('n','<C-S>',':wa<cr>',opts);

map('n','<S-l>',':bnext<cr>',opts);
map('n','<S-h>',':bprevious<cr>',opts);
map('n','<space>bd',':bd<cr>',opts);
