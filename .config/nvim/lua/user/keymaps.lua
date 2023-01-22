local group = vim.api.nvim_create_augroup('mapping_cmds', {clear = true})

--" In normal mode, pressing ctrl + numpad's+ increases the font
--noremap <leader>+ :call AdjustFontSize(2)<CR>
--noremap <leader>- :call AdjustFontSize(-2)<CR>
--noremap <leader>0 :call NormalFontSize()<CR>
--
--" Easier split navigations
--nnoremap <C-J> <C-W><C-J>
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
--nnoremap <C-K> <C-W><C-K>
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
--nnoremap <C-L> <C-W><C-L>
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
--nnoremap <C-H> <C-W><C-H>
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
--
--" Insert date
vim.keymap.set('n', '<leader>.', '"=strftime("%F")<CR>Pa<CR><ESC>')
--
--" Spellcheck
vim.keymap.set('n', '<leader>o', ':setlocal spell spelllang=sv,en<CR>:set complete+=kspell<CR>')
--autocmd BufRead,BufNewFile *.md setlocal spell spelllang=sv,en complete+=kspell
--
--" Switch between the last two files
vim.keymap.set('n', '<leader><leader>', '<C-^>')
--
--" Edit this file
vim.keymap.set('n', '<leader>b', ':e $MYVIMRC<CR>')

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--" Save and close buffer
--command Wbd write <bar> bdelete
--
--" Functions
--
--"Examples:
--":call Exec('buffers')
--"This will include the output of :buffers into the current buffer.
--"
--"Also try:
--":call Exec('ls')
--":call Exec('autocmd')
--
--funct! Exec(command)
--redir =>output
--silent exec a:command
--redir END
--let @o = output
--execute "put o"
--return ''
--endfunct!
