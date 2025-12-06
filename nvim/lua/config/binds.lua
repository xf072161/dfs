vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { silent = true })

vim.keymap.set('n', '<leader>b', ':Neotree toggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { silent = true })
vim.keymap.set('n', '<leader>s', ':w<CR>', { silent = true })
vim.keymap.set('n', '<leader>w', ':Bwipeout<CR>', { silent = true })

vim.keymap.set('n', ',s', ':vsplit<CR>', { silent = true })
vim.keymap.set('n', ',v', ':split<CR>', { silent = true })

vim.keymap.set('n', '<C-Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')

vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]e", vim.diagnostic.goto_next)

vim.keymap.set('n', 'fg', ':FzfLua git_status<CR>', { silent = true })
vim.keymap.set('n', 'ff', ':FzfLua files<CR>', { silent = true })
vim.keymap.set('n', 'fs', ':FzfLua live_grep<CR>', { silent = true })
vim.keymap.set('n', 'fw', ':FzfLua grep_cword<CR>', { silent = true })
vim.keymap.set('n', 'fd', ':FzfLua diagnostics_workspace<CR>', { silent = true })
vim.keymap.set('n', 'fb', ':FzfLua buffers<CR>', { silent = true })

vim.keymap.set("n", "<C-k>", function()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local line, col = cursor_pos[1] - 1, cursor_pos[2]
  local diagnostics = vim.diagnostic.get(0, { lnum = line, col = col })

  if #diagnostics > 0 then
    vim.diagnostic.open_float()
  else
    vim.lsp.buf.hover({ border = "rounded", max_width = 50, max_height = 20 })
  end
end, { silent = true })

vim.keymap.set("n", "<S-k>", function()
    vim.lsp.buf.hover({ border = "rounded", max_width = 50, max_height = 20 })
end, { silent = true })
