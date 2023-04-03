require("nvim-tree").setup({
	diagnostics = {
		enable = true,
	},
  filters = {
    custom = {
      "*.meta",
    },
  },
})
