return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		cmd = { "ConformInfo" },
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = {
				sql = true,
				json = true,
				yaml = true,
			}
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			end
			return {
				timeout_ms = 1000,
				lsp_format = "fallback",
			}
		end,
		formatters_by_ft = {
			go = { "gofmt" },
			lua = { "stylua" },
			python = { "isort", "black" },
			sql = { "sql_formatter" },
			json = { "jq" },
			yaml = { "yq" },
		},
		formatters = {
			sql_formatter = {
				args = { "--config", ".sql-formatter.json" },
			},
		},
	},
}
