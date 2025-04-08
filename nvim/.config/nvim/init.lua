-- Leader Bind
vim.g.mapleader = "<Space>"


-- Setup Lazy
require("config.lazy")

-- Setup Autocloser
require("autoclose").setup()

-- Setup Markdown Renderer 
require("render-markdown").enable()


-- Keybinds
vim.keymap.set({'n', 'v'}, '<CR>', 'o<Esc>k')
vim.keymap.set({'n', 'v'}, '<S-CR>', 'O<Esc>j')

vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')

vim.keymap.set({'n', 'v'},'<leader>h','<C-w>h')
vim.keymap.set({'n', 'v'},'<leader>j','<C-w>j')
vim.keymap.set({'n', 'v'},'<leader>k','<C-w>k')
vim.keymap.set({'n', 'v'},'<leader>l','<C-w>l')

vim.keymap.set({'i', 'v', 'n'}, 'aa','<Esc>')

--vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

-- User commands
vim.api.nvim_create_user_command('Lm', 'Leet menu', {})
vim.api.nvim_create_user_command('Lc', 'Leet console', {})
vim.api.nvim_create_user_command('Ll', 'Leet lang', {})
vim.api.nvim_create_user_command('Li', 'Leet info', {})
vim.api.nvim_create_user_command('Ld', 'Leet desc', {})
vim.api.nvim_create_user_command('Lt', 'Leet test', {})
vim.api.nvim_create_user_command('Lr', 'Leet run', {})
vim.api.nvim_create_user_command('Ls', 'Leet submit', {})
vim.api.nvim_create_user_command('Lo', 'Leet open', {})
vim.api.nvim_create_user_command('Le', 'Leet exit', {})


-- General Formatting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.wo.number = true

vim.opt.laststatus = 3

vim.opt.cmdheight = 0


-- Session Options
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"


-- LSP Setup 
local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config['luals'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      }
    }
  }
}

vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  filetypes = { 'go' },
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

vim.lsp.enable('luals')
vim.lsp.enable('gopls')
vim.diagnostic.config({ update_in_insert = true })
