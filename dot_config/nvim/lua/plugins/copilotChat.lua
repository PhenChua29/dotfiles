return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		enabled = false,
		keys = {
			{ "<leader>c", "<cmd>CopilotChat<CR>", desc = "Copilot Chat" },
		},
		dependencies = {
			"github/copilot.vim",
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {},
	},
}
