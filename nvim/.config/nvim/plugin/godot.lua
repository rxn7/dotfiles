local ok, godot = pcall(require, "godot")
if not ok then
	return
end

local config = {
	bin = "/usr/bin/godot",
}

godot.setup(config)
