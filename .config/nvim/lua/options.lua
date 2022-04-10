vim.o.completeopt = 'menu,menuone,noselect'
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5 vim.wo.number = true vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'
vim.wo.wrap = false
vim.o.tabstop = 8
vim.bo.tabstop = 8
vim.o.softtabstop = 8
vim.bo.softtabstop = 8
vim.o.shiftwidth = 8
vim.bo.shiftwidth = 8
vim.o.updatetime = 300
vim.o.hidden = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.background = 'dark'
vim.o.clipboard = 'unnamedplus'
vim.o.guicursor = 'n-v-c-sm-i:block,ci-ve:ver25,r-cr-o:hor20'

vim.cmd[[ au BufNewFile,BufRead *.ejs set filetype=html ]]

-- Colors
vim.o.termguicolors = true
vim.cmd('colorscheme gruvbox')
vim.cmd('highlight Normal guibg=none')
vim.cmd('highlight NonText guibg=none')
