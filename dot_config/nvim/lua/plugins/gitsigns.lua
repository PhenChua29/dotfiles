return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			signs_staged = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
		},

		config = function(_, opts)
			require("gitsigns").setup(opts)
			vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#5fafff" })
		end,

		keys = {
			{ "]h", "<cmd>Gitsigns nav_hunk next<CR>", mode = { "n", "x" }, desc = "Next Hunk" },
			{ "[h", "<cmd>Gitsigns nav_hunk prev<CR>", mode = { "n", "x" }, desc = "Previous Hunk" },
			{ "]H", "<cmd>Gitsigns nav_hunk last<CR>", mode = { "n", "x" }, desc = "Last Hunk" },
			{ "[H", "<cmd>Gitsigns nav_hunk first<CR>", mode = { "n", "x" }, desc = "First Hunk" },

			-- Keep ":" instead of "<cmd>" here so visual mode passes the selected range.
			{ "<leader>gs", ":Gitsigns stage_hunk<CR>", mode = { "n", "x" }, desc = "Stage Hunk" },
			{ "<leader>gr", ":Gitsigns reset_hunk<CR>", mode = { "n", "x" }, desc = "Reset Hunk" },

			{ "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage Buffer" },
			{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
			{ "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<CR>", desc = "Preview Hunk Inline" },

			{ "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame Line" },
			{ "<leader>gB", "<cmd>Gitsigns blame<CR>", desc = "Blame Buffer" },

			{ "<leader>ghd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff This" },
			{ "<leader>ghD", "<cmd>Gitsigns diffthis ~<CR>", desc = "Diff This ~" },

			{ "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "GitSigns Select Hunk" },
		},
	},
}
