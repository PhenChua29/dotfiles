return {
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		keys = {
			{ "<leader>gl", "<cmd>silent LazyGit<CR>", desc = "LazyGit" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		init = function()
			vim.g.lazygit_floating_window_scaling_factor = 1.0
			vim.g.lazygit_floating_window_winblend = 0
		end,
	},
}
