return {
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		keys = {
			{ "<leader>e", "<cmd>Oil<CR>", desc = "Open explorer" },
		},
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
	},
}
