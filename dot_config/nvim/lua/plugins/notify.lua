return {
	{
		"rcarriga/nvim-notify",
		lazy = false,
		opts = {
			background_colour = "#000000",
		},
		config = function(_, opts)
			local notify = require("notify")
			notify.setup(opts)

			_G.notify = notify

			local banned_messages = { "No information available" }
			vim.notify = function(msg, ...)
				for _, banned in ipairs(banned_messages) do
					if msg == banned then
						return
					end
				end
				return notify(msg, ...)
			end
		end,
	},
}
