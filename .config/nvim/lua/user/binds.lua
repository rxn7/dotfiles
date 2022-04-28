local opts = {noremap=true, silent=true}
local map = vim.api.nvim_set_keymap

map('n','<C-s>',':w<cr>',opts)
map('i','<C-c>','<esc>',opts)
map('n','<C-S>',':wa<cr>',opts);

map('n','<S-l>',':bnext<cr>',opts);
map('n','<S-h>',':bprevious<cr>',opts);
map('n','<C-b>d',':bd<cr>',opts);

map('n','<C-p>',':Telescope find_files<cr>',opts)
map('n','<C-f>',':NvimTreeToggle<cr>',opts)

map('n', '<space>cp', ':source ~/.config/nvim/init.lua<cr>:PackerCompile<cr>:PackerInstall<cr>',opts)

map('n','<C-space>',':FloatermToggle<cr>',opts)
map('t','<C-space>','<C-\\><C-n>:FloatermToggle<cr>',opts)
map('t','<C-t>h','<C-\\><C-n>:FloatermPrev<cr>',opts)
map('t','<C-t>l','<C-\\><C-n>:FloatermNext<cr>',opts)
map('t','<C-t>n','<C-\\><C-n>:FloatermNew<cr>',opts)
map('t','<C-t>d','<C-\\><C-n>:FloatermKill<cr>:FloatermToggle<cr>',opts)

map('i', '<Up>', '<Nop>',opts);
map('i', '<Down>', '<Nop>',opts);
map('i', '<Left>', '<Nop>',opts);
map('i', '<Right>', '<Nop>',opts);

map('n', '<Up>', '<Nop>',opts);
map('n', '<Down>', '<Nop>',opts);
map('n', '<Left>', '<Nop>',opts);
map('n', '<Right>', '<Nop>',opts);
