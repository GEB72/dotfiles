return {
	{
		'VonHeikemen/fine-cmdline.nvim',
		enabled = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require('fine-cmdline').setup({
				cmdline = {
				enable_keymaps = true,
				smart_history = true,
				prompt = ': '
			  },
			  popup = {
				position = {
				  row = '50%',
				  col = '50%',
				},
				size = {
				  width = '60%',
				},
				border = {
				  style = 'rounded',
				},
				win_options = {
				  winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
				},
			  },
			  hooks = {
				before_mount = function(input)
				  -- code
				end,
				after_mount = function(input)
				  -- code
				end,
				set_keymaps = function(imap, feedkeys)
				  -- code
				end
			  }
			})
		end,
	}
}
