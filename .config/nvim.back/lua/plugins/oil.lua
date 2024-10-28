return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			["<C-h>"] = false,
			["<C-l>"] = false,
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
