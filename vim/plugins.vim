""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> Load plugins
"    -> Plugin settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'               " Commenter
Plug 'scrooloose/nerdtree'                    " Plugin for listing directory structure
Plug 'tpope/vim-fugitive'                     " Plugin for git inside vim
Plug 'tpope/vim-repeat'

" => Fuzzy finder (File, Buffer, Git, everything)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

""""""""""""""""""""""""""""""
" => Language specific plugin
""""""""""""""""""""""""""""""
" => Vue
Plug 'posva/vim-vue'

" => Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Add plugins to &runtimepath
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

""""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""""

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fo <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

