" specify directory for plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
" initialize plugin system
call plug#end()

" move selected lines up one line
xnoremap <C-S-Up> :m-2<CR>gv=gv
" move selected lines down one line
xnoremap <C-S-Down> :m'>+<CR>gv=gv
" move current line up one line
nnoremap <C-S-Up> :<C-u>m-2<CR>==
" move current line down one line
nnoremap <C-S-Down> :<C-u>m+<CR>==

:lua require('init')
