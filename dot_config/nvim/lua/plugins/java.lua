return {
	{
		"nvim-java/nvim-java",
		enabled = false,
		config = function()
			require("java").setup()
			vim.lsp.enable("jdtls")
		end,
	},
}
