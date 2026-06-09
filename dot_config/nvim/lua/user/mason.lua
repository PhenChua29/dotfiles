local ok, mason = pcall(require, "mason")

if not ok then
	print("Error while loading: mason")
	notify(mason, "error", { title = "mason" })
	return
end

mason.setup({
	registries = {
		"github:mason-org/mason-registry",
	},
})

local ok, masonInstaller = pcall(require, "mason-tool-installer")

if not ok then
	print("Error while loading: mason-tool-installer")
	notify(masonInstaller, "error", { title = "mason-tool-installer" })
	return
end

masonInstaller.setup({
	ensure_installed = {
		-- formatter
		"stylua",
		"prettier",
		"clang-format",
		"shfmt",
		"taplo",
		"black",

		-- lsp
		"typescript-language-server",
		"css-lsp", -- CSS, SCSS, LESS
		"jdtls", -- Java
		"tailwindcss-language-server",
		"kotlin-language-server",
		"ansible-language-server",
		"eslint-lsp",
		"basedpyright", -- Python
		"groovy-language-server",
		"terraform-ls",
		"gopls",
		"rust-analyzer",
		"helm-ls",
		"yaml-language-server",

		-- linter
		"golangci-lint",
		"ruff",
		"shellcheck",
	},
})

local ok, masonLsp = pcall(require, "mason-lspconfig")

if not ok then
	print("Error while loading: mason-lspconfig")
	notify(masonLsp, "error", { title = "mason-lspconfig" })
	return
end

local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
	print("Error while loading: lspconfig")
	vim.notify(lspconfig, "error", { title = "lspconfig" })
	return
end

masonLsp.setup()
local ignore = { lint = { unknownAtRules = "ignore" } }

vim.lsp.config("cssls", {
	-- Ignore the annoying unknownAtRules error in css files
	settings = {
		css = ignore,
		scss = ignore,
		less = ignore,
	},
})

vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",
			},
		},
	},
})
