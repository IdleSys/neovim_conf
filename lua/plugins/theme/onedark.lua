return {
  'navarasu/onedark.nvim',
  config = function(_, opts)
    require('onedark').setup {
      style = 'deep',
    }
    require('onedark').load()
  end,
}
