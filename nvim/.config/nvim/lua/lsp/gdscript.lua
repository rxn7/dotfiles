local M = {}

function M.setup(lspc, capabilities)
	lspc.gdscript.setup({
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150
		}
	})
end

return M
