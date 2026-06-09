return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"SergioRibera/cmp-dotenv",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			local compare = cmp.config.compare
			local ok_luasnip, luasnip = pcall(require, "luasnip")
			local debug = false

			local function get_border(joins, horizontal, vertical)
				return { joins, horizontal, joins, vertical, joins, horizontal, joins, vertical }
			end

			local function get_border_multiple_joins(joins, horizontal, vertical)
				return { joins[1], horizontal, joins[2], vertical, joins[3], horizontal, joins[4], vertical }
			end

			local borders = {
				"single",
				"double",
				"rounded",
				get_border("+", "-", "|"),
				get_border_multiple_joins({ "┏", "┓", "┛", "┗" }, "━", "┃"),
			}

			local kind_icons = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			}

			return {
				sources = cmp.config.sources({
					{
						name = "buffer",
						option = {
							keyword_length = 1,
							get_bufnrs = function()
								local max_size = 50
								local api = vim.api
								local bufs = api.nvim_get_current_buf()
								local size = api.nvim_buf_get_offset(0, api.nvim_buf_line_count(0))

								if size / 1024 / 1024 > max_size then
									return {}
								end

								return { bufs }
							end,
						},
					},
					{ name = "path" },
					{
						name = "dotenv",
						option = {
							load_shell = false,
							dotenv_environment = ".*",
						},
					},
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}),
				mapping = {
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
				},
				experimental = {
					ghost_text = true,
				},
				window = {
					completion = {
						border = borders[3],
						winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
						scrollbar = false,
					},
					documentation = {
						border = borders[3],
						winhighlight = "Normal:None,FloatBorder:None",
					},
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, item)
						local function vanilla(_, formatted_item, show_source)
							if debug then
								print(string.format("item: %s", vim.inspect(formatted_item)))
							end

							local icon_name = formatted_item.kind
							formatted_item.menu = formatted_item.kind
							formatted_item.kind = string.format("%s", kind_icons[icon_name])

							local custom_names = {
								buffer = "[Buffer]",
								path = "[Path]",
								dotenv = "[Env]",
								nvim_lua = "[Nvim lua]",
								nvim_lsp = "[LSP]",
							}

							if show_source then
								formatted_item.menu =
									string.format("   %-12s%s", formatted_item.menu, custom_names[entry.source.name])
							else
								formatted_item.menu = string.format("   %s", formatted_item.menu)
							end

							if debug then
								print(string.format("item (modified): %s", vim.inspect(formatted_item)))
							end

							return formatted_item
						end

						return vanilla(entry, item, true)
					end,
				},
				sorting = {
					comparators = {
						function(entry1, entry2)
							local s1, s2 = entry1.source.name, entry2.source.name

							if s1 == "nvim_lsp" and s2 ~= "nvim_lsp" then
								return true
							elseif s2 == "nvim_lsp" and s1 ~= "nvim_lsp" then
								return false
							end

							return nil
						end,
						compare.offset,
						compare.exact,
						compare.score,
						compare.recently_used,
						compare.locality,
						compare.kind,
						compare.sort_text,
						compare.length,
						compare.order,
					},
				},
				snippet = {
					expand = function(args)
						if not ok_luasnip then
							vim.snippet.expand(args.body)
							return
						end

						luasnip.lsp_expand(args.body)
					end,
				},
			}
		end,
	},
}
