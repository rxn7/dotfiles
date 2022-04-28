local get_hex = require('cokeline/utils').get_hex

local green = vim.g.terminal_color_2
local yellow = vim.g.terminal_color_3

local errors_fg = get_hex('DiagnosticError', 'fg')
local warnings_fg = get_hex('DiagnosticWarn', 'fg')

local components = {
	separator = {
		text = ' ',
		truncation = { priority = 1 },
	},

	space = {
		text = ' | ',
		truncation = { priority = 1 },
		fg = green
	},

	devicon = {
		text = function(buffer)
			return buffer.devicon.icon
		end,
		fg = function(buffer)
			return buffer.devicon.color
		end,
		truncation = { priority = 1 },
	},

	filename = {
		text = function(buffer)
			return buffer.filename
		end,
		fg = function(buffer)
			return
				(buffer.diagnostics.errors ~= 0 and errors_fg)
				or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
				or nil
		end,
		style = function(buffer)
			return
				((buffer.is_focused and buffer.diagnostics.errors ~= 0)
					and 'bold,underline')
				or (buffer.is_focused and 'bold')
				or (buffer.diagnostics.errors ~= 0 and 'underline')
				or nil
		end,
		truncation = {
			priority = 2,
			direction = 'left',
		},
	},

	unsaved = {
		text = function(buffer)
			return buffer.is_modified and '●' or ''
		end,
		fg = function(buffer)
			return green
		end,
		truncation = { priority = 1 },
	},
}

require('cokeline').setup({
	show_if_buffers_are_at_least = 1,

	buffers = {
		filter_valid = function(buffer) return buffer.type ~= 'terminal' end,
		filter_visible = function(buffer) return buffer.type ~= 'terminal' end,
		focus_on_delete = 'next',
		new_buffers_position = 'next',
	},

	rendering = {
		max_buffer_width = 40,
	},

	default_hl = {
		fg = function(buffer)
			return
				buffer.is_focused
				and get_hex('Normal', 'fg')
				or get_hex('Comment', 'fg')
		end,

		bg = get_hex('ColorColumn', 'bg'),
	},

	sidebar = {
		filetype = 'NvimTree',
		components = {
			{
				text = '  NvimTree',
				fg = yellow,
				bg = get_hex('NvimTreeNormal', 'bg'),
				style = 'bold',
			},
		}
	},

	components = {
		components.separator,
		components.devicon,
		components.filename,
		components.space,
		components.unsaved,
	},
})
