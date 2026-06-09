vim.filetype.add({
	pattern = {
		[".*/templates/.*%.ya?ml"] = "helm",
		[".*/templates/.*%.tpl"] = "helm",

		[".*/values%.yaml"] = "yaml.helm-values",
		[".*/values%.yml"] = "yaml.helm-values",
		[".*/values%..*%.yaml"] = "yaml.helm-values",
		[".*/values%..*%.yml"] = "yaml.helm-values",
	},
})
