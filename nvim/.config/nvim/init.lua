require('keymaps')
require('options')

if not vim.g.vscode then
    require('plugins')
    require('colorscheme')
    require('lsp')
end
