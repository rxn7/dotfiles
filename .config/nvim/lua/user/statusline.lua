local function filename()
	local fname = vim.fn.expand("%%:t")
	if fname == "" then
		return fname
	end
	return fname .. " "
end

local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = "  " .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = "  " .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = "  " .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = " %#LspDiagnosticsSignInformation# " .. count["info"]
	end

	return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function lineinfo()
	if vim.bo.filetype == "alpha" then
		return ""
	end
	return " %P %l:%c "
end

Statusline = {}

Statusline.active = function()
	return table.concat {
		"%#Normal# ",
		filename(),
		"%#Normal# ",
		lsp(),
		"%=%#StatusLineExtra#",
		lineinfo(),
	}
end

function Statusline.inactive()
	return filename()
end

function Statusline.short()
	return ""
end

vim.api.nvim_exec([[
	augroup Statusline
	au!
	au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
	au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
	au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
	augroup END
]], false)
