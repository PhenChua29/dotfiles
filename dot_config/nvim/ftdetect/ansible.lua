vim.filetype.add({
	pattern = {
		[".*/roles/[^/]+/tasks/.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/[^/]+/handlers/.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/[^/]+/defaults/.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/[^/]+/vars/.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/[^/]+/meta/.*%.ya?ml"] = "yaml.ansible",
		[".*/playbooks?/.*%.ya?ml"] = "yaml.ansible",
		[".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
		[".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
	},
})
