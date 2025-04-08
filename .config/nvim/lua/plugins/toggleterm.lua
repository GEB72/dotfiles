return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require("toggleterm").setup({})
			vim.keymap.set('n', '<leader>tr', '<cmd>ToggleTerm<CR>')
		end,
	}
}
