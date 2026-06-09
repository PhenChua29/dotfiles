return {
	{
		"github/copilot.vim",
		enabled = false,
		event = "BufEnter",
		config = function()
			vim.g.copilot_filetypes = {
				["*"] = false,
				typescriptreact = true,
				typescript = true,
				json = true,
				java = true,
			}
		end,
	},
}
