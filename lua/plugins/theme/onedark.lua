return {
  'navarasu/onedark.nvim',
  config = function(_, opts)
    require('onedark').setup {
      style = 'deep',
    }
    -- require('onedark').load()
    -- Setting highlight colors to transparent
    -- local highlights = {
    --   'Normal', -- General background for text
    --   'CursorLine', -- Background for current line highlight
    --   'StatusLine', -- Background for status line
    --   'VertSplit', -- Background for vertical splits
    --   'SignColumn', -- Background for the sign column (left of line numbers)
    --   'Pmenu', -- Popup menu background
    --   'PmenuSel', -- Popup menu selected item background
    --   'TabLine', -- Background for tab line
    --   'TabLineSel', -- Background for selected tab line
    --   'EndOfBuffer', -- Background for empty space at the end of the buffer
    --   'NonText', -- Background for non-text (like invisible characters)
    --   'FoldColumn', -- Background for fold column
    --   'DiffAdd', -- Background for added lines in diff
    --   'DiffChange', -- Background for changed lines in diff
    --   'DiffDelete', -- Background for deleted lines in diff
    --   'DiffText', -- Background for changed sections in diff
    -- }
    --
    -- for _, group in ipairs(highlights) do
    --   vim.api.nvim_set_hl(0, group, { ctermbg = 'NONE', bg = 'NONE' })
    -- end
  end,
}
