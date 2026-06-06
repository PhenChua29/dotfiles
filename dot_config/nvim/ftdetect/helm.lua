vim.filetype.add({
	pattern = {
		[".*/templates/.*%.yaml"] = "helm",
		[".*/templates/.*%.yml"] = "helm",
		[".*/templates/.*%.tpl"] = "helm",

		[".*/values%.yaml"] = "yaml.helm-values",
		[".*/values%.yml"] = "yaml.helm-values",
		[".*/values%..*%.yaml"] = "yaml.helm-values",
		[".*/values%..*%.yml"] = "yaml.helm-values",
	},
})
