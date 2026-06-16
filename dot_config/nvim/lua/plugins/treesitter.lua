return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local parsers = {
				"lua",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"c",
				"cpp",
				"c_sharp",
				"java",
				"python",
				"rust",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"kotlin",
				"groovy",
				"bash",
				"terraform",

				"json",
				"markdown",
				"markdown_inline",
				"toml",
				"yaml",
				"helm",
				"gotmpl",
			}

			local ts = require("nvim-treesitter")
			ts.install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = parsers,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
