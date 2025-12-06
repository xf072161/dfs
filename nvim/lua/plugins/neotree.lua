local windowopts = {
	position = "left",
	width = 30,
	mapping_options = { noremap = true, nowait = true },
	mappings = {
		["d"] = "delete", 		 ["r"] = "rename",
		["m"] = "move",				 ["c"] = "copy",
		["l"] = "open",				 ["A"] = "add_directory",
		["a"] = "add",				 ["h"] = "close_node",
		["s"] = "open_vsplit", ["H"] = "close_all_nodes",
		["f"] = "",
	}
}

local diropts = {
	{ "indent" },
	{ "icon" },
	{ "current_filter" },
	{ "container",
		content = {
			{ "diagnostics",
				errors_only = true,
				zindex = 20,
				align = "right",
				hide_when_expanded = false,
				symbols = { hint = "", info = "", warn = "", error = "" },
			},
			{ "name", zindex = 10 },
			{ "type", zindex = 10, align = "right" },
			{ "file_size", zindex = 10, align = "right" },
			{ "last_modified", zindex = 10, align = "right" }
		}
	}
}

local fileopts = {
	{ "indent" },
	{ "icon" },
	{ "container",
		content = {
			{ "diagnostics",
				zindex = 20,
				align = "right",
				symbols = { hint = "", info = "", warn = "", error = "" },
			},
			{ "git_status",
				zindex = 10,
				align = "right",
				symbols = { added = "A", deleted = "D", modified = "M", renamed = "R", untracked = "U", ignored = "I", conflict = "C", unstaged = "", staged = "" }
			},
			{ "name", zindex = 10 }, { "file_size", zindex = 10, align = "right" }, { "type", zindex = 10, align = "right" }, { "last_modified", zindex = 10, align = "right" },
		}
	}
}

local custom_icon = function(config, node, state)
	if node.type == "directory" then
		if node:is_expanded() then
			return {
				text = "⌄",
				highlight = config.highlight,
			}
		end
			return {
				text = "›",
				highlight = config.highlight,
			}
		end
		return require("neo-tree.sources.common.components").icon(config,
			node, state)
	end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		require("neo-tree").setup({
			filesystem = {
				components = {
					icon = custom_icon,
				},
				hijack_netrw_behavior = "open_default",
				window = windowopts,
				follow_current_file = {
					enabled = true,
				},
				filtered_items = { visible = false, hide_dotfiles = false, hide_gitignored = false, hide_by_name = { ".git" } }
			},
			default_component_configs = {
				indent = { with_markers = false, indent_size = 2 },
				modified = { symbol = "", highlight = "NeoTreeModified" },
			},
			renderers = {
				directory = diropts,
				file = fileopts,
				message = { { "indent", with_markers = false }, { "name", highlight = "NeoTreeMessage" } },
				terminal = { { "indent" }, { "icon" }, { "name" }, { "bufnr" } }
			},
		})
	end
}

