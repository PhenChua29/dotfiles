local function set_neogit_highlights()
	vim.api.nvim_set_hl(0, "NeogitHunkHeader", {
		fg = "#d3c6aa",
	})

	-- Current hunk area
	vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", {
		fg = "#d3c6aa",
		bold = true,
	})

	-- Cursor directly on hunk header
	vim.api.nvim_set_hl(0, "NeogitHunkHeaderCursor", {
    fg = "#e0dcc7",
		bold = true,
	})
end

return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"ibhagwan/fzf-lua",
    "esmuellert/codediff.nvim",
	},
	cmd = "Neogit",
	init = function()
		set_neogit_highlights()

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = set_neogit_highlights,
		})
	end,
	opts = {
		disable_hint = true,
		process_spinner = true,
	},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
}
