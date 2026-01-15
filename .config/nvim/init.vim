" wakusei - disable as much disk writes as possible
" melody - re-enable shadafile
" set noswapfile shadafile=NONE
set noswapfile

" plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'xiyaowong/transparent.nvim'
Plug 'm4xshen/autoclose.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'nvim-lualine/lualine.nvim'
Plug 'rhysd/conflict-marker.vim'

call plug#end()

lua << END
require('lualine').setup()
END
