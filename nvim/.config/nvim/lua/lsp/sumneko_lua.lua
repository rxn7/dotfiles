local library = {}
local path = vim.split(package.path, ';')

table.insert(path, 'lua/?.lua')
table.insert(path, 'lua/?/init.lua')

local function add_lib(lib)
	for _, p in pairs(vim.fn.expand(lib, false, true)) do
		p = vim.loop.fs_realpath(p)
		if p ~= nil then
			library[p] = true
		end
	end
end

add_lib('~/.config/nvim')
add_lib('~/.local/share/nvim/site/pack/packer/opt/*')
add_lib('~/.local/share/nvim/site/pack/packer/start/*')

return {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = path
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = library,
				maxPreload = 2000,
				preloadFileSize = 50000
			},
			telemetry = { enable = false, }
		}
	}
}
