" specify directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'

" initialize plugin system
call plug#end()

lua << EOF
  require('start')
EOF
