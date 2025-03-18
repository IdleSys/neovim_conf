vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.o.pumblend = 10
vim.o.winblend = 10

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.colorcolumn = '+1'
vim.opt.textwidth = 80

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Setting highlight colors to transparent
local highlights = {
  'Normal', -- General background for text
  'CursorLine', -- Background for current line highlight
  'StatusLine', -- Background for status line
  'VertSplit', -- Background for vertical splits
  'SignColumn', -- Background for the sign column (left of line numbers)
  'Pmenu', -- Popup menu background
  'PmenuSel', -- Popup menu selected item background
  'TabLine', -- Background for tab line
  'TabLineSel', -- Background for selected tab line
  'EndOfBuffer', -- Background for empty space at the end of the buffer
  'NonText', -- Background for non-text (like invisible characters)
  'FoldColumn', -- Background for fold column
  'DiffAdd', -- Background for added lines in diff
  'DiffChange', -- Background for changed lines in diff
  'DiffDelete', -- Background for deleted lines in diff
  'DiffText', -- Background for changed sections in diff
}

for _, group in ipairs(highlights) do
  vim.api.nvim_set_hl(0, group, { ctermbg = 'NONE', bg = 'NONE' })
end
