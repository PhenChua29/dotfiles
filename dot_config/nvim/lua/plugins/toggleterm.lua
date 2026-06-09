return {
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "ToggleTermToggleAll" },
		keys = {
			{ "<leader>t", "<cmd>silent ToggleTerm direction=float<CR>", desc = "Toggle terminal" },
			{ "<leader>t", "<cmd>ToggleTermToggleAll<CR>", mode = "t", desc = "Toggle terminals" },
		},
		opts = {},
	},
}
