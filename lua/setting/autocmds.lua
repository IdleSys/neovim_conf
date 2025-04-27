vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- [[ Mini files LSP integrated rename ]]
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesActionRename',
  callback = function(event)
    require('snacks').rename.on_rename_file(event.data.from, event.data.to)
  end,
})

-- [[ Setting nvim title to project root directory]]
vim.api.nvim_create_augroup('SetProjectTitle', { clear = true })

vim.api.nvim_create_autocmd('VimEnter', {
  group = 'SetProjectTitle',
  pattern = '*',
  callback = function()
    -- Don't set the title if you just opened Neovim
    if vim.fn.argc() == 0 then
      return
    end
    -- Set the title based on the project directory name
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    vim.opt.titlestring = project_name
    vim.opt.title = true
  end,
})

vim.api.nvim_create_autocmd('DirChanged', {
  group = 'SetProjectTitle',
  pattern = '*',
  callback = function()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    vim.opt.titlestring = project_name
    vim.opt.title = true
  end,
})
