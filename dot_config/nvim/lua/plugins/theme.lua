return {
	{ "daschw/leaf.nvim", enabled = false },
	{ "loctvl842/monokai-pro.nvim", enabled = false },
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			require("onedarkpro").setup(opts)
			vim.cmd("colorscheme onedark_dark")
		end,
	},
}
