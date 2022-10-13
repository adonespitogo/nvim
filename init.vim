" specify directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" initialize plugin system
call plug#end()

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

:lua require('init')
