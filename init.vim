" specify directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" initialize plugin system
call plug#end()

:lua require('start')
