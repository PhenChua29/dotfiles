local options = {
	linebreak = true, -- Wrap at word boundary
}

for k, v in pairs(options) do
	vim.opt_local[k] = v
end
