vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5 vim.wo.number = true vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'
vim.wo.wrap = false
vim.opt.tabstop = 8
vim.bo.tabstop = 8
vim.opt.updatetime = 100
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.background = 'dark'
vim.opt.clipboard = 'unnamedplus' vim.opt.guicursor = 'n-v-c-sm-i:block,ci-ve:ver25,r-cr-o:hor20'
vim.opt.laststatus = 2
vim.opt.showtabline = 2
vim.opt.showmode = false

vim.cmd[[ au BufNewFile,BufRead *.ejs set filetype=html ]]

vim.o.termguicolors = true
vim.cmd('colorscheme zenburn')
