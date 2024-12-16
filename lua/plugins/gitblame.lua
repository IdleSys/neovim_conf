return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = false,
    message_template = ' <author> • <summary> • <date>',
    date_format = '%m-%d-%Y %H:%M:%S', -- template for the date, check Date format section for more options
    virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
  },
  keys = {
    { '<leader>gb', ':GitBlameToggle<CR>', desc = 'Toggle [G]it [B]lame' },
  },
}
