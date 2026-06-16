return {
	"pwntester/octo.nvim",
	cmd = "Octo",
	opts = {
		picker = "default",
		enable_builtin = true,
	},
	keys = {
		{
			"<leader>oi",
			"<CMD>Octo issue list<CR>",
			desc = "List GitHub Issues",
		},
		{
			"<leader>op",
			"<CMD>Octo pr list<CR>",
			desc = "List GitHub PullRequests",
		},
		{
			"<leader>or",
			"<CMD>Octo pr reload<CR>",
			desc = "Reload PullRequests",
		},
		{
			"<leader>od",
			"<CMD>Octo discussion list<CR>",
			desc = "List GitHub Discussions",
		},
		{
			"<leader>on",
			"<CMD>Octo notification list<CR>",
			desc = "List GitHub Notifications",
		},
		{
			"<leader>os",
			function()
				require("octo.utils").create_base_search_command({ include_current_repo = true })
			end,
			desc = "Search GitHub",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
		"nvim-tree/nvim-web-devicons",
	},
}
