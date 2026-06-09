return {
	{
		"dense-analysis/ale",
		enabled = false,
		main = "ale",
		opts = {
			fixers = {
				python = { "ruff" },
				javascript = { "prettier", "eslint" },
				go = { "golangci-lint" },
				yaml = { "yamlfmt" },
			},
		},
	},
}
