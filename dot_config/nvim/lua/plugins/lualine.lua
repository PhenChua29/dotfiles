return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			local theme = require("lualine.themes.auto")
			theme.normal.c.bg = "None"

			return {
				sections = {
					lualine_a = {},
					lualine_b = { "filename" },
					lualine_c = {},
					lualine_x = { "searchcount", "diagnostics" },
					lualine_y = { "diff", "progress", "branch" },
					lualine_z = {},
				},
				options = { theme = theme },
			}
		end,
	},
}
