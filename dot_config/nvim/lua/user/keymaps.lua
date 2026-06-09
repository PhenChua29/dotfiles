local opts = { noremap = true, silent = true }
local maps = {
	-- Better navigation between windows
	{ "n", "<C-h>", "<C-w>h", opts },
	{ "n", "<C-j>", "<C-w>j", opts },
	{ "n", "<C-k>", "<C-w>k", opts },
	{ "n", "<C-l>", "<C-w>l", opts },

	-- let space key do nothing
	{ "", "<Space>", "<Nop>", opts },

	-- Resize windows
	{ "n", "<Up>", ":sil resize -2<CR>", opts },
	{ "n", "<Down>", ":sil resize +2<CR>", opts },
	{ "n", "<Left>", ":sil vertical resize -2<CR>", opts },
	{ "n", "<Right>", ":sil vertical resize +2<CR>", opts },

	-- Switch bettween buffers
	{ "n", "<S-l>", ":sil bnext<CR>", opts },
	{ "n", "<S-h>", ":sil bprevious<CR>", opts },

	-- Move lines up/down
	{ "n", "<A-j>", ":sil move .+1<CR>==", opts },
	{ "n", "<A-k>", ":sil move .-2<CR>==", opts },
	{ "i", "<A-j>", "<ESC>:sil move .+1<CR>==gi", opts },
	{ "i", "<A-k>", "<ESC>:sil move .-2<CR>==gi", opts },
	{ "v", "<A-j>", ":sil move '>+1<CR>gv=gv", opts },
	{ "v", "<A-k>", ":sil move '<-2<CR>gv=gv", opts },

	-- Move line left/right
	{ "v", "<", "<gv", opts },
	{ "v", ">", ">gv", opts },

	-- Terminal
	{ "t", "<C-\\>", "<C-\\><C-n>", opts },

	-- Appearance
	{ "n", "<ESC>", ":sil noh<CR>", opts },

	-- Lsp
	{ "n", "gi", ":sil lua vim.lsp.buf.implementation()<CR>", opts },
	{ "n", "gd", ":sil lua vim.lsp.buf.definition()<CR>", opts },
	{ "n", "gh", ":sil lua vim.lsp.buf.hover()<CR>", opts },

	-- trouble
	{
		"n",
		"<leader>y",
		function()
			vim.diagnostic.open_float({
				scope = "cursor",
				focus = false,
				border = "rounded",
				source = "if_many",
			})
		end,
		opts,
	},
	-- =========== Editting ===========

	-- Formating
	{ "n", "<leader>l", ":sil Format<cr>", opts },

	-- Code actions
	{ "n", "<M-CR>", ":lua vim.lsp.buf.code_action()<cr>", opts },
}

-- Ensure that the leader key is set to space before setting any keymaps

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

for _, map in pairs(maps) do
	keymap(map[1], map[2], map[3], map[4])
end

-- Remove that annoying <C-l> keymap in netrw so that it cannot block the <C-l> keymap navigation

vim.cmd([[
  augroup netrw_mapping
    autocmd!
    autocmd Filetype netrw lua NetrwMapping()
  augroup END
]])

function NetrwMapping()
	vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", "<C-w>l", opts)
end
