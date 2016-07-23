set t_Co=256 " more colours
colorscheme maroloccio
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

filetype plugin on
filetype indent on
set number
set smartindent

set ruler       "always show current position
set hlsearch    "highlight search results
set shiftround  "shift to set columns rather than relative
set si
"set mouse=a     "enable mouse selecting (visual mode)

"hi,
"here is a basic .vimrc that you can choose to use if you like.  use all/part/none of it up to you.
" Ty

" disable syntax highlighting
"syntax off

" ignore case during search
set ignorecase

" obey case if search pattern case
set smartcase

" we use a dark terminal background provide appropriate colours
"set background=dark

" shiftwidth is 4 @ sparq
set shiftwidth=4
set tabstop=4

" expandtab, expand tabs as spaces
set expandtab

" fileformats=unix
set ffs=unix 

" <Ctrl-n> to toggle line numbers
map <C-n> :set nu!<CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <silent> <C-g> :echo expand('%:p')<CR><C-g>
nnoremap <silent> <C-h> :echo expand('%:{getcwd()}')<CR><C-g>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" %F    path from home
" %f    file
set statusline=\ %F%m%r%h\ %w\ pos:\(%l,%c)
"set statusline=\ %F%m%r%h\ %w\ CWD:\ %r%{getcwd()}/%f\ \ \ pos:\(%l,%c)\ \ \ %m%r

"  code folding
set foldmethod=manual
set foldlevelstart=99 " open all folds on file open

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" source macros
" TODO check file ext, and load appropriate macros
source ${HOME}/.vimrc.dir/macros.vim

" set explicit tab character for .at files:
syntax on
filetype on
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.at set filetype=autotest
" autocmd Filetype autotest setlocal noexpandtab list
" autocmd BufNewFile,BufRead *.at, *.am, set set noic cin noexpandtab list
