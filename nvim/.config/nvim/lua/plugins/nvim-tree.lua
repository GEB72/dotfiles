return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
	local api = require("nvim-tree.api")

	local function on_attach(bufnr)
	  local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true
		}
	  end

	  -- default mappings
	  api.config.mappings.default_on_attach(bufnr)

	  -- custom mappings
	  vim.keymap.set('n', '<leader>tr', api.tree.reload, {})
	  vim.keymap.set('n', 'cd', api.tree.change_root_to_node, opts('Up'))
	  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	end
	vim.keymap.set('n', '<leader>tt', api.tree.toggle, {})

	require("nvim-tree").setup({
	  on_attach = on_attach,
	  sort = { sorter = "case_sensitive" },
	  view = { width = 30 },
	  renderer = { group_empty = true },
	  filters = { dotfiles = false },
	})

	end,
}
