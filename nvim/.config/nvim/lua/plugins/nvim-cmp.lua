return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        enabled = function ()
			local disabled = false
			disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
			disabled = disabled or (vim.fn.reg_recording() ~= '')
			disabled = disabled or (vim.fn.reg_executing() ~= '')
			disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
			return not disabled
        end,
		experimental = {
		  ghost_text = false,
  		},
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = function ()
			  if cmp.visible() then
				  cmp.close()
			  else
				  cmp.complete()
			  end
		  end,
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", max_item_count = 3 },
          { name = "luasnip", max_item_count = 3 },
        }),
      })
    end,
  },
}
