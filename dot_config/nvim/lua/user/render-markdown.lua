local ok, rm = pcall(require, "render-markdown")

if not ok then
	print("Error while loading: render-markdown")
	vim.notify(rm, "error", { title = "render-markdown" })
	return
end

rm.setup({
	completions = { lsp = { enabled = true } },
	render_modes = { "n", "c", "t", "i", "v", "V", "\22", "s", "S" },
	document = {
		conceal = {
			char_patterns = {
				" %^[-_%w]+%f[\n]",
			},
		},
	},
})
