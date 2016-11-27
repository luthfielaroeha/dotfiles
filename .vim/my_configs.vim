if has('gui_running')
    set guifont=Source\ Code\ Pro\ Medium:h9
endif
set number
set relativenumber
set numberwidth=5

syntax enable
set background=dark

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=gray25
hi CursorLineNr guifg=DarkGrey
" :map <C-w> :close <Enter>
" :map <C-W> :q! <Enter>
autocmd GUIEnter * simalt ~x
nnoremap <F12> :NERDTreeToggle<CR>

function! MakeSession()
	let b:sessiondir = $HOME . "/dotfiles/.vim/sessions" . getcwd()
	if (filewritable(b:sessiondir) != 2)
		exe 'silent !mkdir -p ' b:sessiondir
		redraw!
	endif
	let b:filename = b:sessiondir . '/session.vim'
	exe "mksession! " . b:filename
endfunction

function! LoadSession()
	let b:sessiondir = $HOME . "/dotfiles/.vim/sessions" . getcwd()
	let b:sessionfile = b:sessiondir . "/session.vim"
	if (filereadable(b:sessionfile))
		exe 'source ' b:sessionfile
	else
		echo "No session loaded."
	endif
endfunction

" Adding automatons for when entering or leaving Vim
if (argc() == 0)
	au VimEnter * nested :call LoadSession()
	au VimLeave * :call MakeSession()
endif


set sessionoptions-=options  " Don't save options

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] 

" inoremap ( ()<esc>i
" inoremap [ []<esc>i
" inoremap { {}<esc>i
" inoremap ' ''<esc>i
" inoremap " ""<esc>i
" inoremap < <><esc>i

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

