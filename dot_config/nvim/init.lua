-- My default theme just in case
vim.cmd("colorscheme lunaperche")

local imports = {
	"keymaps",
	"options",
	"plugins",
	"lsp",
	"neovide",
}

for _, v in pairs(imports) do
	local ok, err = pcall(require, "user." .. v)

	if not ok then
		vim.notify("Something's wrong while loading: \"" .. v .. '"\n\n')
		vim.notify(err)
	end
end
