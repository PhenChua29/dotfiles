return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			registries = {
				"github:mason-org/mason-registry",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)

			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"clang-format",
					"shfmt",
					"taplo",
					"black",
					"typescript-language-server",
					"css-lsp",
					"jdtls",
					"tailwindcss-language-server",
					"kotlin-language-server",
					"ansible-language-server",
					"eslint-lsp",
					"basedpyright",
					"groovy-language-server",
					"terraform-ls",
					"gopls",
					"rust-analyzer",
					"helm-ls",
					"yaml-language-server",
					"golangci-lint",
					"ruff",
					"shellcheck",
				},
			})

			require("mason-lspconfig").setup()

			local ignore = { lint = { unknownAtRules = "ignore" } }

			vim.lsp.config("cssls", {
				settings = {
					css = ignore,
					scss = ignore,
					less = ignore,
				},
			})

			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
						},
					},
				},
			})
		end,
	},
}
