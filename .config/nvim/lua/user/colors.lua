vim.cmd('colorscheme default')
vim.highlight.link("LineNr", "Comment", true)
vim.highlight.create("PMenu", { guibg = "#807b0a", guifg = "#fff" }, false)
vim.highlight.create("String", { guibg = 1, guifg = "#e8e11c" }, false)
vim.highlight.create("NormalFloat", { guibg = "None", guifg = "None" }, false)
vim.highlight.create("FloatBorder", { guibg = "None" }, false)
vim.highlight.create("WhichKeyFloat", { guibg = "None" }, false)
vim.highlight.create("BufferTabpageFill", { guifg = "None" }, false)
vim.highlight.create("VertSplit", { guibg = "#000000", guifg = "#00000" }, false)
vim.highlight.create("TelescopeNormal", { guibg = "None", guifg = "None" }, false)
vim.highlight.create("TelescopeBorder", { guibg = "None", guifg = "None" }, false)
vim.highlight.link("TelescopeMatching", "Constant", true)
vim.highlight.create("StatusLine", { guibg = "None" }, false)
vim.highlight.create("StatusLineNC", { guibg = "None" }, false)
vim.highlight.create("LspDiagnosticsVirtualTextError", { guifg = "Red", ctermfg = "Red", gui = "bold" }, false)
vim.highlight.create("DiagnosticVirtualTextError", { guifg = "Red", ctermfg = "Red", gui = "bold" }, false)
vim.highlight.create("LspDiagnosticsVirtualTextWarning", { guifg = "Yellow", ctermfg = "Yellow" }, false)
vim.highlight.create("DiagnosticVirtualTextWarn", { guifg = "Yellow", ctermfg = "Yellow" }, false)
vim.highlight.create("DiagnosticVirtualTextInfo", { guifg = "White", ctermfg = "White" }, false)
vim.highlight.create("DiagnosticVirtualTextHint", { guifg = "White", ctermfg = "White" }, false)
vim.highlight.create("Comment", { gui = "italic", cterm = "italic" }, false)
