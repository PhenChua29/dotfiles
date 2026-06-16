return {
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "ToggleTermToggleAll" },
		opts = {},
		keys = {
			{ "<leader>t", "<cmd>silent ToggleTerm direction=float<CR>", desc = "Toggle terminal" },
		},
	},
}
