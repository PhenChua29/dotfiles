return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		ft = "markdown",
		opts = {
			notes_subdir = "Notes",
			new_notes_location = "notes_subdir",
			workspaces = {
				{
					name = "University",
					path = "~/fpt/notes",
				},
			},
			attachments = {
				folder = "Files",
			},
			daily_notes = {
				folder = "Journey/Daily",
			},
			templates = {
				folder = "Template",
			},
			ui = { enable = false },
			legacy_commands = false,
			frontmatter = {
				enabled = false,
			},
			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,
		},
	},
}
