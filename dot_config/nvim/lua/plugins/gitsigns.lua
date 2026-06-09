return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {},
		config = function(_, opts)
			require("gitsigns").setup(opts)
			vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#5fafff" })
		end,
	},
}
