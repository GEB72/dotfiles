-- Leader Bind
vim.g.mapleader = "<Space>"


-- Execute Setup First
require("config.lazy")
require("autoclose").setup()
require("render-markdown").enable()


-- Keybinds
vim.keymap.set({'n', 'v'}, '<CR>', 'o<Esc>k')
vim.keymap.set({'n', 'v'}, '<S-CR>', 'O<Esc>j')

vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>d', '"+d')

vim.keymap.set({'n'}, '<leader>q', ':q<CR>')
vim.keymap.set({'n'}, '<leader>Q', ':q!<CR>')
vim.keymap.set({'n'}, '<leader><Esc>', ':qa')

vim.keymap.set({'n'}, '<leader>w', ':w<CR>')
vim.keymap.set({'n'}, '<leader>W', ':wa<CR>')

vim.keymap.set({'n', 'v'}, '<leader>sd', '<cmd>lua vim.lsp.buf.hover()<CR>')

vim.keymap.set({'i'}, 'aa','<Esc>')

vim.keymap.set({'v'}, '<leader>r', ':s/\\%V')

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
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.wo.relativenumber = true

vim.opt.laststatus = 3

vim.opt.cmdheight = 0


-- Highlighted Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Show CMD Line in Recording Mode
vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.opt.cmdheight = 1
  end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.opt.cmdheight = 0
  end,
})


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

vim.lsp.config['nil'] = {
  cmd = { 'nil' },
  filetypes = { 'nix' },
  capabilities = capabilities,
  },

vim.lsp.enable('luals')
vim.lsp.enable('gopls')
vim.lsp.enable('nil')
vim.diagnostic.config({ update_in_insert = true })


-- Auto Formatting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
	vim.cmd('silent !go mod tidy')
  end
})
