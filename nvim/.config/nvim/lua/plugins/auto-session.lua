return {
	{
	  'rmagatti/auto-session',
	  lazy = false,
	  keys = {
		{ '<leader>fs', '<cmd>SessionSearch<CR>', desc = 'Session find/search' },
		{ '<leader>s', '<cmd>SessionSave<CR>', desc = 'Save session' },
	  },

	  ---enables autocomplete for opts
	  ---@module "auto-session"
	  ---@type AutoSession.Config
	  opts = {
		session_lens = {
		  load_on_setup = true,
		  previewer = false,
		  theme_conf = {
			border = true,
			-- layout_config = {
			--   width = 0.8, -- Can set width and height as percent of window
			--   height = 0.5,
			-- },
		  },
		},
		allowed_dirs = { '~/dotfiles/*','~/.config/*', '~/Workspace/*' },
	  },
	}
}
