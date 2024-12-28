return {
  'navarasu/onedark.nvim',
  config = function(_, opts)
    require('onedark').setup {
      style = 'deep',
    }
    require('onedark').load()
    vim.cmd 'hi ColorColumn ctermbg=235 guibg=#3E3B2F'
  end,
}
