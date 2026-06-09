-- Nice list of popular plugins: https://github.com/rockerBOO/awesome-neovim
----------------------------------------------------------------------------

local installPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local repo = "https://github.com/folke/lazy.nvim.git"
local cmd = {
	"git",
	"clone",
	"--filter=blob:none",
	repo,
	"--branch=stable",
	installPath,
}

if not (vim.uv or vim.loop).fs_stat(installPath) then
	vim.fn.system(cmd)
	print("Lazy.nvim directory not detected, installing...")
end

vim.opt.rtp:prepend(installPath)

local ok, lazy = pcall(require, "lazy")
if not ok then
	print("Error while loading: Lazy.nvim")
	error(lazy)
end

lazy.setup({
	spec = {
		{ import = "plugins" },
	},
	ui = {
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "󰃭",
			ft = "",
			init = "🚀",
			keys = "󰌆",
			plugin = "",
			runtime = "",
			require = "🎯",
			source = "󰞗",
			start = "🚀",
			task = "󰐃",
			lazy = "💤",
		},
	},
})
