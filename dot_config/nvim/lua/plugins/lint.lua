return {
	{
		"mfussenegger/nvim-lint",
		event = "BufReadPre",
		config = function()
			local lint = require("lint")

			vim.api.nvim_create_user_command("Lint", function()
				lint.try_lint()
			end, {})

			vim.keymap.set("n", "<leader>;", lint.try_lint, { desc = "Run lint" })

			lint.linters_by_ft = {
				python = { "ruff" },
				javascript = { "prettier", "eslint" },
				go = { "golangcilint" },
				sh = { "shellcheck" },
			}
		end,
	},
}
