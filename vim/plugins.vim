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

Plug 'jlanzarotta/bufexplorer'                " Buff Explorer
Plug 'scrooloose/nerdcommenter'               " Commenter
Plug 'scrooloose/nerdtree'                    " Plugin for listing directory structure
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'                     " Plugin for git inside vim
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'                        " For searching inside file
Plug 'w0rp/ale'                               " Asynchronous lint engine

" => Dark powered neo-completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

""""""""""""""""""""""""""""""
" => Language specific plugin
""""""""""""""""""""""""""""""
" => Vue
Plug 'posva/vim-vue'


" Add plugins to &runtimepath
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
map <leader>o :BufExplorer<cr>

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

" => FZF
nnoremap <silent> <C-p> :FZF<cr>

" => Ack
map <leader>g :Ack 

" => Ale
let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'

" => Deoplete
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/local/bin/python3'
