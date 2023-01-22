return {
  'sudormrfbin/cheatsheet.nvim', -- Hit <leader>? to invoke cheatsheet telescope
  keys = "<leader>?",
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-lua/popup.nvim' },
  }
}
