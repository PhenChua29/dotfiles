return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			completions = { lsp = { enabled = true } },
			render_modes = { "n", "c", "t", "i", "v", "V", "\22", "s", "S" },
			document = {
				conceal = {
					char_patterns = {
						" %^[-_%w]+%f[\n]",
					},
				},
			},
			bullet = {
				icons = { "•" },
			},
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)

			local function apply_markdown_highlights()
				vim.api.nvim_set_hl(0, "RenderMarkdownBullet", {
					link = "Comment",
				})

				local heading_links = {
					[1] = "Title",
					[2] = "Function",
					[3] = "Type",
					[4] = "Keyword",
					[5] = "Constant",
					[6] = "Comment",
				}

				for level, group in pairs(heading_links) do
					vim.api.nvim_set_hl(0, "@markup.heading." .. level .. ".markdown", {
						link = group,
					})

					vim.api.nvim_set_hl(0, "RenderMarkdownH" .. level, {
						link = group,
					})

					vim.api.nvim_set_hl(0, "RenderMarkdownH" .. level .. "Bg", {
						bg = "NONE",
					})
				end
			end

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = apply_markdown_highlights,
			})

			apply_markdown_highlights()
		end,
	},
}
