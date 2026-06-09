return {
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				css = true,
				tailwind = "both",
				sass = { enable = true, parsers = { "css" } },
				always_update = true,
			},
		},
	},
}
